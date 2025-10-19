import 'package:cnv_coach/data/models/calendar_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CalendarEvent', () {
    test(
      'nextOccurrence retourne la date prévue pour une action ponctuelle',
      () {
        final scheduledAt = DateTime(2024, 1, 10, 15);
        final event = CalendarEvent(
          title: 'Prendre la parole',
          description: null,
          scheduledAt: scheduledAt,
        );

        final result = event.nextOccurrence(from: DateTime(2024, 1, 5));

        expect(result, scheduledAt);
        expect(event.isRecurring, isFalse);
      },
    );

    test(
      'nextOccurrence calcule la prochaine occurrence pour une action récurrente passée',
      () {
        final scheduledAt = DateTime(2024, 1, 1, 9);
        final event = CalendarEvent(
          title: 'Pratique quotidienne',
          description: null,
          scheduledAt: scheduledAt,
          repeatIntervalDays: 2,
        );

        final result = event.nextOccurrence(from: DateTime(2024, 1, 5));

        expect(result, DateTime(2024, 1, 5, 9));
      },
    );

    test(
      'nextOccurrence garde la première occurrence si elle est encore à venir',
      () {
        final now = DateTime(2024, 3, 10, 8);
        final scheduledAt = DateTime(2024, 3, 12, 18);
        final event = CalendarEvent(
          title: 'Préparation réunion',
          description: null,
          scheduledAt: scheduledAt,
          repeatIntervalDays: 7,
        );

        final result = event.nextOccurrence(from: now);

        expect(result, scheduledAt);
      },
    );

    test(
      'copyWith permet de mettre à jour et de dissocier une entrée de journal',
      () {
        final event = CalendarEvent(
          title: 'Préparation réunion',
          description: 'Réviser mes notes',
          scheduledAt: DateTime(2024, 3, 12, 18),
          linkedJournalEntryId: 'entry-1',
        );

        final updated = event.copyWith(linkedJournalEntryId: 'entry-2');
        expect(updated.linkedJournalEntryId, 'entry-2');

        final cleared = updated.copyWith(clearLinkedJournalEntry: true);
        expect(cleared.linkedJournalEntryId, isNull);
      },
    );
  });
}
