import 'package:cnv_coach/data/models/journal_entry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// L'état qui contient les données de l'entrée en cours de création.
class EntryFlowState {
  final String? observation;
  final List<String> feelings;
  final String? need;
  final String? demand;

  EntryFlowState({
    this.observation,
    this.feelings = const [],
    this.need,
    this.demand,
  });

  EntryFlowState copyWith({
    String? observation,
    List<String>? feelings,
    String? need,
    String? demand,
  }) {
    return EntryFlowState(
      observation: observation ?? this.observation,
      feelings: feelings ?? this.feelings,
      need: need ?? this.need,
      demand: demand ?? this.demand,
    );
  }
}

/// Le Notifier qui gère la logique de mise à jour de l'état.
class EntryFlowNotifier extends Notifier<EntryFlowState> {
  @override
  EntryFlowState build() {
    return EntryFlowState(); // État initial
  }

  void setObservation(String observation) {
    state = state.copyWith(observation: observation);
  }

  void addFeeling(String feeling) {
    state = state.copyWith(feelings: [...state.feelings, feeling]);
  }

  void removeFeeling(String feeling) {
    state = state.copyWith(feelings: state.feelings.where((f) => f != feeling).toList());
  }

  void setNeed(String need) {
    state = state.copyWith(need: need);
  }

  void setDemand(String demand) {
    state = state.copyWith(demand: demand);
  }

  // Réinitialise l'état à sa valeur initiale
  void reset() {
    state = EntryFlowState();
  }
}

/// Le Provider qui expose notre Notifier à l'UI.
final entryFlowProvider = NotifierProvider<EntryFlowNotifier, EntryFlowState>(EntryFlowNotifier.new);
