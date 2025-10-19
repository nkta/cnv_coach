import 'package:cnv_coach/data/models/journal_entry.dart';
import 'package:cnv_coach/data/models/calendar_event.dart';
import 'package:cnv_coach/presentation/providers/calendar_providers.dart';
import 'package:cnv_coach/presentation/providers/journal_providers.dart';
import 'package:cnv_coach/presentation/screens/calendar/calendar_event_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class JournalEditScreen extends ConsumerStatefulWidget {
  final JournalEntry entry;

  const JournalEditScreen({super.key, required this.entry});

  @override
  ConsumerState<JournalEditScreen> createState() => _JournalEditScreenState();
}

class _JournalEditScreenState extends ConsumerState<JournalEditScreen> {
  static const String _noLinkedEventValue = '__no_linked_event__';

  late final TextEditingController _observationController;
  late final TextEditingController _feelingsController;
  late final TextEditingController _needController;
  late final TextEditingController _demandController;
  final _formKey = GlobalKey<FormState>();
  String? _selectedLinkedEventId;
  String? _initialLinkedEventId;

  @override
  void initState() {
    super.initState();
    _observationController =
        TextEditingController(text: widget.entry.observation);
    _feelingsController =
        TextEditingController(text: widget.entry.feelings.join(', '));
    _needController = TextEditingController(text: widget.entry.need);
    _demandController = TextEditingController(text: widget.entry.demand);

    final events = ref.read(calendarEventsProvider);
    final linkedEventId = _findLinkedEventId(events);
    _selectedLinkedEventId = linkedEventId;
    _initialLinkedEventId = linkedEventId;
  }

  @override
  void dispose() {
    _observationController.dispose();
    _feelingsController.dispose();
    _needController.dispose();
    _demandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final calendarEvents = ref.watch(calendarEventsProvider);
    final availableEventIds =
        calendarEvents.map((event) => event.id).toSet();
    final dropdownValue = (_selectedLinkedEventId != null &&
            availableEventIds.contains(_selectedLinkedEventId))
        ? _selectedLinkedEventId!
        : _noLinkedEventValue;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Modifier mon entrée'),
        actions: [
          IconButton(
            icon: const Icon(Icons.event_available_outlined),
            tooltip: 'Enregistrer et planifier',
            onPressed: () => _saveEntry(openPlanner: true),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildTextField(
              controller: _observationController,
              label: 'Observation',
              maxLines: 4,
            ),
            _buildTextField(
              controller: _feelingsController,
              label: 'Sentiments (séparés par des virgules)',
              helperText:
                  'Exemple : joyeux, reconnaissant, inspiré',
            ),
            _buildTextField(
              controller: _needController,
              label: 'Besoin',
            ),
            _buildTextField(
              controller: _demandController,
              label: 'Demande',
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: dropdownValue,
              decoration: const InputDecoration(
                labelText: 'Action planifiée associée',
                helperText:
                    'Optionnel — reliez cette entrée à une action du calendrier.',
              ),
              items: [
                const DropdownMenuItem<String>(
                  value: _noLinkedEventValue,
                  child: Text('Aucune (optionnel)'),
                ),
                ...calendarEvents.map(
                  (event) => DropdownMenuItem<String>(
                    value: event.id,
                    child: Text(_formatEventOption(event)),
                  ),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedLinkedEventId =
                      value == _noLinkedEventValue ? null : value;
                });
              },
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => _saveEntry(),
              icon: const Icon(Icons.save),
              label: const Text('Enregistrer les modifications'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => _saveEntry(openPlanner: true),
              icon: const Icon(Icons.event_available),
              label: const Text('Enregistrer et planifier'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? helperText,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Ce champ est requis';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          helperText: helperText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Future<void> _saveEntry({bool openPlanner = false}) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final messenger = ScaffoldMessenger.of(context);
    final feelings = _feelingsController.text
        .split(',')
        .map((feeling) => feeling.trim())
        .where((feeling) => feeling.isNotEmpty)
        .toList();

    final updatedEntry = widget.entry.copyWith(
      observation: _observationController.text.trim(),
      feelings: feelings,
      need: _needController.text.trim(),
      demand: _demandController.text.trim(),
    );

    await ref
        .read(journalEntriesProvider.notifier)
        .updateEntry(updatedEntry);

    final events = ref.read(calendarEventsProvider);
    final availableIds = events.map((event) => event.id).toSet();
    final selectedLink = (_selectedLinkedEventId != null &&
            availableIds.contains(_selectedLinkedEventId))
        ? _selectedLinkedEventId
        : null;
    final initialLink = (_initialLinkedEventId != null &&
            availableIds.contains(_initialLinkedEventId))
        ? _initialLinkedEventId
        : null;

    if (selectedLink != initialLink) {
      final notifier = ref.read(calendarEventsProvider.notifier);

      if (initialLink != null) {
        await notifier.setJournalEntryLink(
          eventId: initialLink,
          journalEntryId: null,
        );
      }

      if (selectedLink != null) {
        await notifier.setJournalEntryLink(
          eventId: selectedLink,
          journalEntryId: updatedEntry.id,
        );
      }

      _initialLinkedEventId = selectedLink;
      _selectedLinkedEventId = selectedLink;
    }

    if (!mounted) return;

    messenger.showSnackBar(
      const SnackBar(
        content: Text('Entrée mise à jour avec succès'),
      ),
    );

    if (openPlanner) {
      await context.push(
        '/calendar/event',
        extra: CalendarEventFormConfig(
          linkedJournalEntry: updatedEntry,
          initialTitle: updatedEntry.demand,
        ),
      );
      if (!mounted) {
        return;
      }
    }

    context.pop();
  }

  String? _findLinkedEventId(List<CalendarEvent> events) {
    try {
      return events
          .firstWhere(
            (event) => event.linkedJournalEntryId == widget.entry.id,
          )
          .id;
    } catch (_) {
      return null;
    }
  }

  String _formatEventOption(CalendarEvent event) {
    final dateFormat = DateFormat.yMMMd('fr_FR');
    final timeFormat = DateFormat.Hm('fr_FR');
    final date = dateFormat.format(event.scheduledAt);
    final time = timeFormat.format(event.scheduledAt);
    final recurrenceLabel =
        event.isRecurring ? ' · récurrente (${event.repeatIntervalDays} j)' : '';
    return '${event.title} — $date à $time$recurrenceLabel';
  }
}
