import 'package:cnv_coach/presentation/providers/journal_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class JournalScreen extends ConsumerWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final journalEntries = ref.watch(journalEntriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Journal'),
      ),
      body: journalEntries.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.book_outlined, size: 60, color: Colors.grey),
                    const SizedBox(height: 16),
                    Text(
                      'Votre journal est vide.',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Appuyez sur le bouton + pour commencer votre première pratique d\'auto-empathie.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              itemCount: journalEntries.length,
              itemBuilder: (context, index) {
                final entry = journalEntries[index];
                return Dismissible(
                  key: ValueKey(entry.id),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    ref.read(journalServiceProvider).deleteEntry(entry.id);
                    ref.invalidate(journalEntriesProvider);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Entrée supprimée')),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text(entry.observation, maxLines: 2, overflow: TextOverflow.ellipsis),
                      subtitle: Text(DateFormat.yMMMd('fr_FR').format(entry.createdAt)),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // TODO: Naviguer vers l'écran de détail de l'entrée
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/journal/add/observation');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
