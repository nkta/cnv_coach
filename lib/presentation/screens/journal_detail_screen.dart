import 'package:cnv_coach/data/models/calendar_event.dart';
import 'package:cnv_coach/data/models/journal_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:cnv_coach/presentation/providers/calendar_providers.dart';
import 'package:cnv_coach/presentation/screens/calendar/calendar_event_form_screen.dart';
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
    final calendarEvents = ref.watch(calendarEventsProvider);
    final linkedEvents = calendarEvents
        .where(
          (event) => event.linkedJournalEntryId == currentEntry.id,
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat.yMMMd('fr_FR').format(currentEntry.createdAt)),
        actions: [
          IconButton(
            icon: const Icon(Icons.copy),
            tooltip: 'Copier',
            onPressed: () async {
              final copiedContent = _buildCopyContent(currentEntry);
              await Clipboard.setData(ClipboardData(text: copiedContent));
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Entrée copiée dans le presse-papiers.')),
                );
              }
            },
          ),
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
          if ((currentEntry.selfReflection ?? '').isNotEmpty)
            _buildDetailCard(
              context,
              title: 'Mon ressenti',
              content: currentEntry.selfReflection!,
              icon: Icons.psychology_alt_outlined,
            ),
          if ((currentEntry.otherReflection ?? '').isNotEmpty)
            _buildDetailCard(
              context,
              title: "Ressenti de l'autre",
              content: currentEntry.otherReflection!,
              icon: Icons.group_outlined,
            ),
          if (currentEntry.actions.isNotEmpty)
            _buildActionsCard(context, currentEntry.actions),
          if (linkedEvents.isNotEmpty)
            _buildLinkedEventsCard(context, linkedEvents),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () => context.push('/journal/report', extra: currentEntry),
            icon: const Icon(Icons.note_alt_outlined),
            label: const Text('Mettre à jour le compte rendu'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => context.go('/journal'),
            child: const Text('Retour au journal'),
          ),
        ],
      ),
    );
  }

  String _buildCopyContent(JournalEntry entry) {
    final buffer = StringBuffer()
      ..writeln('Date : ${DateFormat.yMMMd('fr_FR').format(entry.createdAt)}')
      ..writeln()
      ..writeln('Observation :')
      ..writeln(entry.observation)
      ..writeln()
      ..writeln('Sentiments :')
      ..writeln(entry.feelings.join(', '))
      ..writeln()
      ..writeln('Besoin :')
      ..writeln(entry.need)
      ..writeln()
      ..writeln('Demande :')
      ..writeln(entry.demand);

    if ((entry.selfReflection ?? '').isNotEmpty) {
      buffer
        ..writeln()
        ..writeln('Mon ressenti :')
        ..writeln(entry.selfReflection);
    }

    if ((entry.otherReflection ?? '').isNotEmpty) {
      buffer
        ..writeln()
        ..writeln("Ressenti de l'autre :")
        ..writeln(entry.otherReflection);
    }

    if (entry.actions.isNotEmpty) {
      buffer
        ..writeln()
        ..writeln('Actions à entreprendre :')
        ..writeln(entry.actions.map((action) => '- $action').join('\n'));
    }

    return buffer.toString().trim();
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

  Widget _buildActionsCard(BuildContext context, List<String> actions) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.flag_outlined, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  'Actions à entreprendre',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...actions.map(
              (action) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• '),
                    Expanded(
                      child: Text(
                        action,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLinkedEventsCard(
    BuildContext context,
    List<CalendarEvent> events,
  ) {
    final dateFormat = DateFormat.yMMMd('fr_FR');
    final timeFormat = DateFormat.Hm('fr_FR');

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const Icon(Icons.event_available),
            title: const Text('Actions planifiées liées'),
            subtitle: const Text('Touchez une action pour ouvrir sa fiche.'),
          ),
          const Divider(height: 0),
          ...events.map(
            (event) => ListTile(
              title: Text(event.title),
              subtitle: Text(
                '${dateFormat.format(event.scheduledAt)} · ${timeFormat.format(event.scheduledAt)}'
                '${event.isRecurring ? ' · Répétition tous les ${event.repeatIntervalDays} jours' : ''}',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                context.push(
                  '/calendar/event',
                  extra: CalendarEventFormConfig(initialEvent: event),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
