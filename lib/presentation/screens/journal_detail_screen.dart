import 'package:cnv_coach/data/models/journal_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:cnv_coach/presentation/providers/journal_providers.dart';

class JournalDetailScreen extends ConsumerWidget {
  final JournalEntry entry;

  const JournalDetailScreen({super.key, required this.entry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final journalEntries = ref.watch(journalEntriesProvider);
    final currentEntry = journalEntries.firstWhere(
      (item) => item.id == entry.id,
      orElse: () => entry,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat.yMMMd('fr_FR').format(currentEntry.createdAt)),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Modifier',
            onPressed: () {
              context.push('/journal/edit', extra: currentEntry);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildDetailCard(
            context,
            title: 'Observation',
            content: currentEntry.observation,
            icon: Icons.visibility_outlined,
          ),
          _buildDetailCard(
            context,
            title: 'Sentiments',
            content: currentEntry.feelings.join(', '),
            icon: Icons.favorite_border,
          ),
          _buildDetailCard(
            context,
            title: 'Besoin',
            content: currentEntry.need,
            icon: Icons.lightbulb_outline,
          ),
          _buildDetailCard(
            context,
            title: 'Demande',
            content: currentEntry.demand,
            icon: Icons.record_voice_over_outlined,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => context.go('/journal'),
            child: const Text('Retour au journal'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailCard(BuildContext context, {required String title, required String content, required IconData icon}) {
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
            const SizedBox(height: 16),
            Text(content, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
