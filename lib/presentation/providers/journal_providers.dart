import 'package:cnv_coach/data/services/journal_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Ce provider expose l'instance du JournalService.
// On lui passe une implémentation par défaut qui sera remplacée dans le main.dart
// par l'instance correctement initialisée.
final journalServiceProvider = Provider<JournalService>((ref) {
  // Cette implémentation ne sera jamais utilisée si on override bien dans le ProviderScope.
  throw UnimplementedError();
});

// Ce provider dépend du précédent et expose la liste des entrées du journal.
// Les widgets pourront écouter ce provider pour se mettre à jour automatiquement.
final journalEntriesProvider = Provider((ref) {
  final journalService = ref.watch(journalServiceProvider);
  return journalService.getEntries();
});
