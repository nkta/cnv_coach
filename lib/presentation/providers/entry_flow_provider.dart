import 'package:cnv_coach/data/models/journal_entry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// L'état qui contient les données de l'entrée en cours de création.
class EntryFlowState {
  final String? observation;
  final List<String> feelings;
  final List<String> needs;
  final String? demand;

  EntryFlowState({
    this.observation,
    this.feelings = const [],
    this.needs = const [],
    this.demand,
  });

  EntryFlowState copyWith({
    String? observation,
    List<String>? feelings,
    List<String>? needs,
    String? demand,
  }) {
    return EntryFlowState(
      observation: observation ?? this.observation,
      feelings: feelings != null
          ? List<String>.from(feelings)
          : List<String>.from(this.feelings),
      needs: needs != null
          ? List<String>.from(needs)
          : List<String>.from(this.needs),
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

  void toggleNeed(String need) {
    final updatedNeeds = List<String>.from(state.needs);
    final existingIndex = updatedNeeds.indexOf(need);

    if (existingIndex >= 0) {
      updatedNeeds.removeAt(existingIndex);
    } else {
      updatedNeeds.add(need);
    }

    state = state.copyWith(needs: updatedNeeds);
  }

  void clearNeeds() {
    state = state.copyWith(needs: []);
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
