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
  final String need;

  @HiveField(5)
  final String demand;

  JournalEntry({
    required this.observation,
    required this.feelings,
    required this.need,
    required this.demand,
  })  : id = const Uuid().v4(),
        createdAt = DateTime.now();
}
