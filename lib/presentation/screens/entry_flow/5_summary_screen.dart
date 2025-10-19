import 'package:cnv_coach/data/models/journal_entry.dart';
import 'package:cnv_coach/presentation/providers/entry_flow_provider.dart';
import 'package:cnv_coach/presentation/providers/journal_providers.dart';
import 'package:cnv_coach/presentation/screens/calendar/calendar_event_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SummaryScreen extends ConsumerWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entryState = ref.watch(entryFlowProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Étape 5/5 : Récapitulatif'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSummaryCard(
            context,
            title: 'Observation',
            content: entryState.observation ?? 'Non défini',
            icon: Icons.visibility_outlined,
          ),
          _buildSummaryCard(
            context,
            title: 'Sentiments',
            content: entryState.feelings.join(', ').isNotEmpty
                ? entryState.feelings.join(', ')
                : 'Non défini',
            icon: Icons.favorite_border,
          ),
          _buildSummaryCard(
            context,
            title: 'Besoin',
            content: entryState.need ?? 'Non défini',
            icon: Icons.lightbulb_outline,
          ),
          _buildSummaryCard(
            context,
            title: 'Demande',
            content: entryState.demand ?? 'Non défini',
            icon: Icons.record_voice_over_outlined,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () => _handleSave(
              context,
              ref,
              entryState,
            ),
            child: const Text('Enregistrer dans mon journal'),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            icon: const Icon(Icons.event_available),
            label: const Text('Enregistrer et planifier une action'),
            onPressed: () => _handleSave(
              context,
              ref,
              entryState,
              openPlanner: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context, {required String title, required String content, required IconData icon}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text(title, style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            const SizedBox(height: 8),
            Text(content, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSave(
    BuildContext context,
    WidgetRef ref,
    EntryFlowState entryState, {
    bool openPlanner = false,
  }) async {
    if (_hasMissingFields(entryState)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez remplir toutes les étapes avant d\'enregistrer.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final messenger = ScaffoldMessenger.of(context);

    try {
      final newEntry = JournalEntry(
        observation: entryState.observation!,
        feelings: entryState.feelings,
        need: entryState.need!,
        demand: entryState.demand!,
      );

      await ref.read(journalEntriesProvider.notifier).addEntry(newEntry);
      ref.read(entryFlowProvider.notifier).reset();

      messenger.showSnackBar(
        const SnackBar(
          content: Text('Entrée enregistrée avec succès !'),
          backgroundColor: Colors.green,
        ),
      );

      if (openPlanner) {
        await context.push(
          '/calendar/event',
          extra: CalendarEventFormConfig(
            linkedJournalEntry: newEntry,
            initialTitle: newEntry.demand,
          ),
        );
        if (!context.mounted) {
          return;
        }
      }

      context.go('/journal');
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(
          content: Text('Erreur lors de l\'enregistrement : $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  bool _hasMissingFields(EntryFlowState entryState) {
    return entryState.observation == null ||
        entryState.observation!.isEmpty ||
        entryState.feelings.isEmpty ||
        entryState.need == null ||
        entryState.need!.isEmpty ||
        entryState.demand == null ||
        entryState.demand!.isEmpty;
  }
}
