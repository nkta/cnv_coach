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

  @HiveField(6)
  final String? selfReflection;

  @HiveField(7)
  final String? otherReflection;

  @HiveField(8)
  final List<String> actions;

  static const Object _undefined = Object();

  JournalEntry({
    String? id,
    DateTime? createdAt,
    required this.observation,
    required this.feelings,
    required this.need,
    required this.demand,
    this.selfReflection,
    this.otherReflection,
    List<String>? actions,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        actions = List<String>.unmodifiable(actions ?? const []);

  JournalEntry copyWith({
    String? observation,
    List<String>? feelings,
    String? need,
    String? demand,
    Object? selfReflection = _undefined,
    Object? otherReflection = _undefined,
    List<String>? actions,
  }) {
    return JournalEntry(
      id: id,
      createdAt: createdAt,
      observation: observation ?? this.observation,
      feelings: feelings ?? List<String>.from(this.feelings),
      need: need ?? this.need,
      demand: demand ?? this.demand,
      selfReflection: identical(selfReflection, _undefined)
          ? this.selfReflection
          : selfReflection as String?,
      otherReflection: identical(otherReflection, _undefined)
          ? this.otherReflection
          : otherReflection as String?,
      actions: actions ?? List<String>.from(this.actions),
    );
  }
}
