import 'package:cnv_coach/data/models/calendar_event.dart';
import 'package:cnv_coach/data/models/journal_entry.dart';
import 'package:cnv_coach/presentation/providers/calendar_providers.dart';
import 'package:cnv_coach/presentation/providers/journal_providers.dart';
import 'package:cnv_coach/presentation/screens/calendar/calendar_event_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(calendarEventsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Calendrier')),
      body: events.isEmpty
          ? _EmptyCalendarView(onCreate: () => _openForm(context))
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return _CalendarEventTile(event: event);
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openForm(context),
        icon: const Icon(Icons.add),
        label: const Text('Nouvelle action'),
      ),
    );
  }

  void _openForm(BuildContext context, [CalendarEvent? event]) {
    final config = event == null
        ? const CalendarEventFormConfig()
        : CalendarEventFormConfig(initialEvent: event);
    context.push('/calendar/event', extra: config);
  }
}

class _CalendarEventTile extends ConsumerWidget {
  const _CalendarEventTile({required this.event});

  final CalendarEvent event;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateFormat = DateFormat.yMMMMEEEEd('fr_FR');
    final timeFormat = DateFormat.Hm('fr_FR');
    final nextOccurrence = event.nextOccurrence();
    final subtitle = event.isRecurring
        ? 'Prochaine occurrence : ${dateFormat.format(nextOccurrence)} à ${timeFormat.format(nextOccurrence)}\nFréquence : toutes les ${event.repeatIntervalDays} jours'
        : 'Échéance : ${dateFormat.format(event.scheduledAt)} à ${timeFormat.format(event.scheduledAt)}';
    final journalEntries = ref.watch(journalEntriesProvider);
    final linkedEntry = _findLinkedEntry(journalEntries);
    final subtitleLines = <String>[subtitle];

    if (linkedEntry != null) {
      final entryDate = DateFormat.yMMMd('fr_FR').format(linkedEntry.createdAt);
      subtitleLines.add(
        'Entrée liée : $entryDate · ${_truncate(linkedEntry.observation)}',
      );
    }

    return Dismissible(
      key: ValueKey(event.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) {
        ref.read(calendarEventsProvider.notifier).deleteEvent(event.id);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Action supprimée')));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: ListTile(
          leading: Icon(
            event.isRecurring ? LucideIcons.refreshCcw : LucideIcons.calendar,
            color: Theme.of(context).colorScheme.primary,
          ),
          title: Text(event.title),
          subtitle: Text(subtitleLines.join('\n')),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            context.push(
              '/calendar/event',
              extra: CalendarEventFormConfig(initialEvent: event),
            );
          },
          onLongPress: linkedEntry == null
              ? null
              : () {
                  context.push('/journal/detail', extra: linkedEntry);
                },
        ),
      ),
    );
  }

  JournalEntry? _findLinkedEntry(List<JournalEntry> entries) {
    if (event.linkedJournalEntryId == null) {
      return null;
    }
    try {
      return entries.firstWhere(
        (entry) => entry.id == event.linkedJournalEntryId,
      );
    } catch (_) {
      return null;
    }
  }

  String _truncate(String value, {int maxLength = 40}) {
    final trimmed = value.trim();
    if (trimmed.length <= maxLength) {
      return trimmed;
    }
    return '${trimmed.substring(0, maxLength - 1)}…';
  }
}

class _EmptyCalendarView extends StatelessWidget {
  const _EmptyCalendarView({required this.onCreate});

  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(LucideIcons.calendarClock, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'Aucune action planifiée pour le moment.',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.grey[700]),
            ),
            const SizedBox(height: 12),
            Text(
              'Ajoutez une action ponctuelle ou récurrente pour garder le cap sur vos intentions.',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onCreate,
              icon: const Icon(Icons.add),
              label: const Text('Planifier une action'),
            ),
          ],
        ),
      ),
    );
  }
}
