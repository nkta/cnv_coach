import 'package:cnv_coach/data/models/journal_entry.dart';
import 'package:cnv_coach/data/services/journal_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Ce provider expose l'instance du JournalService.
final journalServiceProvider = Provider<JournalService>((ref) {
  // Cette implémentation sera remplacée dans le main.dart par l'instance initialisée.
  throw UnimplementedError('journalServiceProvider must be overridden in ProviderScope');
});

// StateNotifier pour gérer la liste des entrées du journal
class JournalEntriesNotifier extends StateNotifier<List<JournalEntry>> {
  final JournalService _journalService;

  JournalEntriesNotifier(this._journalService) : super([]) {
    // Charger les entrées initiales lors de la création du notifier
    loadEntries();
  }

  /// Charge toutes les entrées depuis le service et met à jour l'état.
  void loadEntries() {
    state = _journalService.getEntries();
  }

  /// Ajoute une nouvelle entrée et rafraîchit la liste.
  Future<void> addEntry(JournalEntry entry) async {
    await _journalService.addEntry(entry);
    // Rafraîchir la liste pour inclure la nouvelle entrée
    loadEntries();
  }

  /// Supprime une entrée et met à jour l'état.
  Future<void> deleteEntry(String id) async {
    await _journalService.deleteEntry(id);
    // On rafraîchit aussi la liste après une suppression.
    loadEntries();
  }
}

// Provider qui expose le JournalEntriesNotifier et sa liste d'entrées.
final journalEntriesProvider =
    StateNotifierProvider<JournalEntriesNotifier, List<JournalEntry>>((ref) {
  final journalService = ref.watch(journalServiceProvider);
  return JournalEntriesNotifier(journalService);
});
