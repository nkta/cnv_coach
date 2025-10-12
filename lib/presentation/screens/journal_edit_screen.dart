import 'package:cnv_coach/data/models/journal_entry.dart';
import 'package:cnv_coach/presentation/providers/journal_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class JournalEditScreen extends ConsumerStatefulWidget {
  final JournalEntry entry;

  const JournalEditScreen({super.key, required this.entry});

  @override
  ConsumerState<JournalEditScreen> createState() => _JournalEditScreenState();
}

class _JournalEditScreenState extends ConsumerState<JournalEditScreen> {
  late final TextEditingController _observationController;
  late final TextEditingController _feelingsController;
  late final TextEditingController _needsController;
  late final TextEditingController _demandController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _observationController =
        TextEditingController(text: widget.entry.observation);
    _feelingsController =
        TextEditingController(text: widget.entry.feelings.join(', '));
    _needsController =
        TextEditingController(text: widget.entry.needs.join(', '));
    _demandController = TextEditingController(text: widget.entry.demand);
  }

  @override
  void dispose() {
    _observationController.dispose();
    _feelingsController.dispose();
    _needsController.dispose();
    _demandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modifier mon entrée'),
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
              controller: _needsController,
              label: 'Besoins (séparés par des virgules)',
              helperText: 'Exemple : repos, connexion, clarté',
            ),
            _buildTextField(
              controller: _demandController,
              label: 'Demande',
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _saveEntry,
              icon: const Icon(Icons.save),
              label: const Text('Enregistrer les modifications'),
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

  Future<void> _saveEntry() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final feelings = _feelingsController.text
        .split(',')
        .map((feeling) => feeling.trim())
        .where((feeling) => feeling.isNotEmpty)
        .toList();

    final needs = _needsController.text
        .split(',')
        .map((need) => need.trim())
        .where((need) => need.isNotEmpty)
        .toList();

    final updatedEntry = widget.entry.copyWith(
      observation: _observationController.text.trim(),
      feelings: feelings,
      needs: needs,
      demand: _demandController.text.trim(),
    );

    await ref
        .read(journalEntriesProvider.notifier)
        .updateEntry(updatedEntry);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Entrée mise à jour avec succès'),
      ),
    );

    context.pop();
  }
}
