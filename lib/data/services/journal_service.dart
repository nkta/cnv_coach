import 'package:cnv_coach/data/models/journal_entry.dart';
import 'package:hive/hive.dart';

class JournalService {
  late final Box<JournalEntry> _journalBox;

  // Méthode pour initialiser le service, à appeler dans le main.dart
  Future<void> init() async {
    // Enregistre l'adaptateur s'il ne l'est pas déjà
    if (!Hive.isAdapterRegistered(JournalEntryAdapter().typeId)) {
      Hive.registerAdapter(JournalEntryAdapter());
    }

    // Ouvre la boîte (notre table de bdd)
    _journalBox = await Hive.openBox<JournalEntry>('journal_entries');
  }

  /// Récupère toutes les entrées du journal, triées par date de création (la plus récente en premier).
  List<JournalEntry> getEntries() {
    final entries = _journalBox.values.toList();
    // Trie les entrées de la plus récente à la plus ancienne
    entries.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return entries;
  }

  /// Ajoute une nouvelle entrée dans la boîte.
  Future<void> addEntry(JournalEntry entry) async {
    await _journalBox.put(entry.id, entry);
  }

  /// Supprime une entrée en utilisant son identifiant unique.
  Future<void> deleteEntry(String id) async {
    await _journalBox.delete(id);
  }

  /// Met à jour une entrée existante.
  Future<void> updateEntry(JournalEntry entry) async {
    await _journalBox.put(entry.id, entry);
  }
  
  /// Ferme la boîte pour libérer les ressources.
  Future<void> close() async {
    await _journalBox.close();
  }
}
