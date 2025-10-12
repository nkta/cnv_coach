import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'journal_entry.g.dart'; // Fichier qui sera généré

@HiveType(typeId: 0)
class JournalEntry extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final DateTime createdAt;

  @HiveField(2)
  final String observation;

  @HiveField(3)
  final List<String> feelings;

  @HiveField(4)
  final List<String> needs;

  @HiveField(5)
  final String demand;

  JournalEntry({
    String? id,
    DateTime? createdAt,
    required this.observation,
    required this.feelings,
    required List<String> needs,
    required this.demand,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        needs = List.unmodifiable(needs);

  JournalEntry copyWith({
    String? observation,
    List<String>? feelings,
    List<String>? needs,
    String? demand,
  }) {
    return JournalEntry(
      id: id,
      createdAt: createdAt,
      observation: observation ?? this.observation,
      feelings: feelings ?? List<String>.from(this.feelings),
      needs: needs ?? List<String>.from(this.needs),
      demand: demand ?? this.demand,
    );
  }
}
