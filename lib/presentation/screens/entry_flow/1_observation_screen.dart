import 'package:cnv_coach/presentation/providers/entry_flow_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ObservationScreen extends ConsumerWidget {
  const ObservationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Étape 1/5 : Observation'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            // Réinitialise l'état et retourne à l'écran du journal
            ref.read(entryFlowProvider.notifier).reset();
            context.go('/journal');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Que s\'est-il passé ?',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Décrivez la situation de manière factuelle, comme une caméra l\'aurait enregistrée.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: TextFormField(
                initialValue: ref.read(entryFlowProvider).observation ?? '',
                onChanged: (value) {
                  ref.read(entryFlowProvider.notifier).setObservation(value);
                },
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  hintText: 'Ex: "Quand j\'ai vu le message, mon cœur s\'est mis à battre plus vite..."',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.go('/journal/add/feeling');
              },
              child: const Text('Suivant'),
            ),
          ],
        ),
      ),
    );
  }
}
