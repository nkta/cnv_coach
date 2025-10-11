import 'package:cnv_coach/presentation/providers/entry_flow_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/voice_dictation_text_field.dart';

class DemandScreen extends ConsumerStatefulWidget {
  const DemandScreen({super.key});

  @override
  ConsumerState<DemandScreen> createState() => _DemandScreenState();
}

class _DemandScreenState extends ConsumerState<DemandScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        TextEditingController(text: ref.read(entryFlowProvider).demand ?? '');

    ref.listen(entryFlowProvider, (previous, next) {
      final newValue = next.demand ?? '';
      if (newValue != _controller.text) {
        _controller.value = _controller.value.copyWith(
          text: newValue,
          selection: TextSelection.collapsed(offset: newValue.length),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Étape 4/5 : Demande'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Quelle action concrète feriez-vous ?',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Formulez une demande positive, concrète et réalisable. Que demanderiez-vous à vous-même ou à quelqu\'un d\'autre ?',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: VoiceDictationTextField(
                controller: _controller,
                onChanged: (value) {
                  ref.read(entryFlowProvider.notifier).setDemand(value);
                },
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  hintText:
                      'Ex: "J\'aimerais prendre 5 minutes pour respirer..." ou "La prochaine fois, serais-tu d\'accord pour..."',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.go('/journal/add/summary');
              },
              child: const Text('Suivant'),
            ),
          ],
        ),
      ),
    );
  }
}
