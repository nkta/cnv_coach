import 'package:cnv_coach/data/models/journal_entry.dart';
import 'package:cnv_coach/presentation/providers/journal_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JournalReportScreen extends ConsumerStatefulWidget {
  final JournalEntry entry;

  const JournalReportScreen({super.key, required this.entry});

  @override
  ConsumerState<JournalReportScreen> createState() => _JournalReportScreenState();
}

class _JournalReportScreenState extends ConsumerState<JournalReportScreen> {
  late final TextEditingController _selfFeelingController;
  late final TextEditingController _otherFeelingController;
  late final TextEditingController _actionsController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _selfFeelingController =
        TextEditingController(text: widget.entry.selfReflection ?? '');
    _otherFeelingController =
        TextEditingController(text: widget.entry.otherReflection ?? '');
    _actionsController =
        TextEditingController(text: widget.entry.actions.join('\n'));
  }

  @override
  void dispose() {
    _selfFeelingController.dispose();
    _otherFeelingController.dispose();
    _actionsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Compte rendu'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              "Consignez votre ressenti après l'échange pour garder une trace de vos apprentissages.",
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            _buildTextField(
              controller: _selfFeelingController,
              label: 'Mon ressenti',
              hintText: 'Ce que je retiens, comment je me sens maintenant…',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Décrivez votre ressenti.';
                }
                return null;
              },
            ),
            _buildTextField(
              controller: _otherFeelingController,
              label: "Ressenti de l'autre (optionnel)",
              hintText: 'Ce que j’ai perçu de son ressenti…',
            ),
            _buildTextField(
              controller: _actionsController,
              label: 'Actions à entreprendre',
              hintText: 'Une action par ligne',
              maxLines: 6,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _saveReport,
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Enregistrer le compte rendu'),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => Navigator.of(context).maybePop(),
              child: const Text('Annuler'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hintText,
    String? Function(String?)? validator,
    int maxLines = 4,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Future<void> _saveReport() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final selfFeeling = _selfFeelingController.text.trim();
    final otherFeeling = _otherFeelingController.text.trim();
    final actions = _actionsController.text
        .split(RegExp(r'[\r\n]+'))
        .map((action) => action.trim())
        .where((action) => action.isNotEmpty)
        .toList();

    final updatedEntry = widget.entry.copyWith(
      selfReflection: selfFeeling.isEmpty ? null : selfFeeling,
      otherReflection: otherFeeling.isEmpty ? null : otherFeeling,
      actions: actions,
    );

    await ref
        .read(journalEntriesProvider.notifier)
        .updateEntry(updatedEntry);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Compte rendu enregistré avec succès.')),
    );

    Navigator.of(context).pop(updatedEntry);
  }
}
