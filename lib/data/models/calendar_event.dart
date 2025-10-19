import 'dart:math';

import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'calendar_event.g.dart';

/// Représente une action programmée dans le calendrier.
@HiveType(typeId: 1)
class CalendarEvent extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String? description;

  /// Date et heure de la première échéance.
  @HiveField(3)
  final DateTime scheduledAt;

  /// Nombre de jours entre chaque répétition. `null` signifie action ponctuelle.
  @HiveField(4)
  final int? repeatIntervalDays;

  @HiveField(5)
  final DateTime createdAt;

  /// Identifiant d'une entrée du journal liée à cette action.
  @HiveField(6)
  final String? linkedJournalEntryId;

  CalendarEvent({
    String? id,
    DateTime? createdAt,
    required this.title,
    required this.description,
    required this.scheduledAt,
    this.repeatIntervalDays,
    this.linkedJournalEntryId,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now();

  bool get isRecurring => repeatIntervalDays != null && repeatIntervalDays! > 0;

  CalendarEvent copyWith({
    String? title,
    String? description,
    DateTime? scheduledAt,
    int? repeatIntervalDays,
    String? linkedJournalEntryId,
    bool clearLinkedJournalEntry = false,
  }) {
    return CalendarEvent(
      id: id,
      createdAt: createdAt,
      title: title ?? this.title,
      description: description ?? this.description,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      repeatIntervalDays: repeatIntervalDays ?? this.repeatIntervalDays,
      linkedJournalEntryId: clearLinkedJournalEntry
          ? null
          : linkedJournalEntryId ?? this.linkedJournalEntryId,
    );
  }

  /// Calcule la prochaine occurrence de l'action à partir d'une date de référence.
  DateTime nextOccurrence({DateTime? from}) {
    final reference = from ?? DateTime.now();

    if (!isRecurring) {
      return scheduledAt;
    }

    if (scheduledAt.isAfter(reference) ||
        scheduledAt.isAtSameMomentAs(reference)) {
      return scheduledAt;
    }

    final intervalDays = max(repeatIntervalDays ?? 0, 1);
    final interval = Duration(days: intervalDays);
    final diff = reference.difference(scheduledAt);

    final occurrencesPassed = (diff.inSeconds / max(interval.inSeconds, 1))
        .ceil();

    return scheduledAt.add(
      Duration(seconds: occurrencesPassed * interval.inSeconds),
    );
  }
}
