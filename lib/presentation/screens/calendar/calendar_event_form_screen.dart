import 'package:cnv_coach/data/models/journal_entry.dart';
import 'package:cnv_coach/data/models/calendar_event.dart';
import 'package:cnv_coach/presentation/providers/calendar_providers.dart';
import 'package:cnv_coach/presentation/providers/journal_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CalendarEventFormConfig {
  const CalendarEventFormConfig({
    this.initialEvent,
    this.linkedJournalEntry,
    this.initialTitle,
    this.initialDescription,
    this.initialDateTime,
  });

  final CalendarEvent? initialEvent;
  final JournalEntry? linkedJournalEntry;
  final String? initialTitle;
  final String? initialDescription;
  final DateTime? initialDateTime;
}

class CalendarEventFormScreen extends ConsumerStatefulWidget {
  const CalendarEventFormScreen({
    required this.config,
    super.key,
  });

  final CalendarEventFormConfig config;

  @override
  ConsumerState<CalendarEventFormScreen> createState() =>
      _CalendarEventFormScreenState();
}

class _CalendarEventFormScreenState
    extends ConsumerState<CalendarEventFormScreen> {
  static const String _noJournalEntryValue = '__no_journal_entry__';

  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _intervalController;

  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;
  bool _isRecurring = false;
  bool _isSaving = false;
  String? _selectedJournalEntryId;
  late final JournalEntry? _prefilledLinkedEntry;

  @override
  void initState() {
    super.initState();
    final initial = widget.config.initialEvent;
    _prefilledLinkedEntry = widget.config.linkedJournalEntry;
    final now = DateTime.now();
    final defaultDate = widget.config.initialDateTime ??
        DateTime(
          now.year,
          now.month,
          now.day,
          now.hour,
        ).add(const Duration(hours: 1));
    _selectedDate = initial?.scheduledAt ?? defaultDate;
    _selectedTime = TimeOfDay.fromDateTime(initial?.scheduledAt ?? defaultDate);
    _isRecurring = initial?.isRecurring ?? false;

    final defaultTitle = initial?.title ??
        widget.config.initialTitle ??
        _prefilledLinkedEntry?.demand ??
        _prefilledLinkedEntry?.need ??
        '';
    _titleController = TextEditingController(text: defaultTitle);

    final defaultDescription = initial?.description ??
        widget.config.initialDescription ??
        _buildLinkedEntryDefaultDescription(_prefilledLinkedEntry);
    _descriptionController = TextEditingController(
      text: defaultDescription ?? '',
    );
    _intervalController = TextEditingController(
      text: initial?.repeatIntervalDays?.toString() ?? '1',
    );
    _selectedJournalEntryId =
        initial?.linkedJournalEntryId ?? _prefilledLinkedEntry?.id;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _intervalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final initialEvent = widget.config.initialEvent;
    final isEditing = initialEvent != null;
    final dateFormat = DateFormat.yMMMMEEEEd('fr_FR');
    final timeFormat = DateFormat.Hm('fr_FR');
    final journalEntries = ref.watch(journalEntriesProvider);
    final availableEntryIds = journalEntries.map((entry) => entry.id).toSet();
    final dropdownItems = <DropdownMenuItem<String>>[
      const DropdownMenuItem<String>(
        value: _noJournalEntryValue,
        child: Text('Aucune (optionnel)'),
      ),
      ...journalEntries.map(
        (entry) => DropdownMenuItem<String>(
          value: entry.id,
          child: Text(_formatJournalEntryOption(entry)),
        ),
      ),
    ];
    if (_prefilledLinkedEntry != null &&
        !availableEntryIds.contains(_prefilledLinkedEntry!.id)) {
      dropdownItems.add(
        DropdownMenuItem<String>(
          value: _prefilledLinkedEntry!.id,
          child: Text(_formatJournalEntryOption(_prefilledLinkedEntry!)),
        ),
      );
    }
    final dropdownValue =
        _selectedJournalEntryId ?? _noJournalEntryValue;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Modifier l’action' : 'Nouvelle action'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Titre',
                hintText: 'Par exemple « Préparer ma prise de parole »',
              ),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Veuillez saisir un titre.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Notes (optionnel)',
                hintText: 'Détails, intentions ou ressources à prévoir...',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: dropdownValue,
              decoration: const InputDecoration(
                labelText: 'Entrée du journal liée',
                helperText:
                    'Permet de rattacher cette action à une réflexion existante.',
              ),
              items: dropdownItems,
              onChanged: (value) {
                setState(() {
                  _selectedJournalEntryId =
                      value == _noJournalEntryValue ? null : value;
                });
              },
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.event),
                    title: const Text('Date'),
                    subtitle: Text(dateFormat.format(_selectedDate)),
                    onTap: _pickDate,
                  ),
                  const Divider(height: 0),
                  ListTile(
                    leading: const Icon(Icons.schedule),
                    title: const Text('Heure'),
                    subtitle: Text(
                      timeFormat.format(
                        DateTime(
                          0,
                          1,
                          1,
                          _selectedTime.hour,
                          _selectedTime.minute,
                        ),
                      ),
                    ),
                    onTap: _pickTime,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SwitchListTile(
              title: const Text('Répéter'),
              subtitle: const Text(
                'Activer pour planifier à une fréquence fixe.',
              ),
              value: _isRecurring,
              onChanged: (value) {
                setState(() {
                  _isRecurring = value;
                });
              },
            ),
            if (_isRecurring) ...[
              const SizedBox(height: 12),
              TextFormField(
                controller: _intervalController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Intervalle de répétition (en jours)',
                  hintText: 'Ex. 7 pour une fois par semaine',
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (!_isRecurring) {
                    return null;
                  }
                  if (value == null || value.isEmpty) {
                    return 'Précisez l’intervalle en jours.';
                  }
                  final parsed = int.tryParse(value);
                  if (parsed == null || parsed <= 0) {
                    return 'L’intervalle doit être un nombre supérieur à zéro.';
                  }
                  return null;
                },
              ),
            ],
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: _isSaving ? null : () => _submit(isEditing),
              icon: _isSaving
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.save),
              label: Text(
                isEditing ? 'Enregistrer les modifications' : 'Créer l’action',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 5 * 365)),
      locale: const Locale('fr', 'FR'),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = DateTime(
          picked.year,
          picked.month,
          picked.day,
          _selectedTime.hour,
          _selectedTime.minute,
        );
      });
    }
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      helpText: 'Sélectionner une heure',
    );

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
        _selectedDate = DateTime(
          _selectedDate.year,
          _selectedDate.month,
          _selectedDate.day,
          picked.hour,
          picked.minute,
        );
      });
    }
  }

  Future<void> _submit(bool isEditing) async {
    final initialEvent = widget.config.initialEvent;
    final messenger = ScaffoldMessenger.of(context);
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final intervalDays = _isRecurring
          ? int.parse(_intervalController.text)
          : null;
      final scheduledAt = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _selectedTime.hour,
        _selectedTime.minute,
      );
      final description = _descriptionController.text.trim();

      final event = CalendarEvent(
        id: initialEvent?.id,
        createdAt: initialEvent?.createdAt,
        title: _titleController.text.trim(),
        description: description.isEmpty ? null : description,
        scheduledAt: scheduledAt,
        repeatIntervalDays: intervalDays,
        linkedJournalEntryId: _selectedJournalEntryId,
      );

      if (isEditing) {
        await ref.read(calendarEventsProvider.notifier).updateEvent(event);
        messenger.showSnackBar(
          const SnackBar(content: Text('Action mise à jour.')),
        );
      } else {
        await ref.read(calendarEventsProvider.notifier).addEvent(event);
        messenger.showSnackBar(const SnackBar(content: Text('Action créée.')));
      }

      if (mounted) {
        Navigator.of(context).pop();
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  String? _buildLinkedEntryDefaultDescription(JournalEntry? entry) {
    if (entry == null) {
      return null;
    }

    final buffer = StringBuffer()
      ..writeln('Observation : ${entry.observation}')
      ..writeln('Sentiments : ${entry.feelings.join(', ')}')
      ..writeln('Besoin : ${entry.need}');

    if (entry.demand.isNotEmpty) {
      buffer.writeln('Demande : ${entry.demand}');
    }

    return buffer.toString().trim();
  }

  String _formatJournalEntryOption(JournalEntry entry) {
    final formattedDate = DateFormat.yMMMd('fr_FR').format(entry.createdAt);
    final observation = entry.observation.trim();
    final truncatedObservation = observation.length > 40
        ? '${observation.substring(0, 37)}…'
        : observation;
    return '$formattedDate · $truncatedObservation';
  }
}
