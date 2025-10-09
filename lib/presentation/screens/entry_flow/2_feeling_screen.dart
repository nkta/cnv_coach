import 'package:cnv_coach/core/constants/cnv_data.dart';
import 'package:cnv_coach/presentation/providers/entry_flow_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FeelingScreen extends ConsumerWidget {
  const FeelingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFeelings = ref.watch(entryFlowProvider).feelings;
    final notifier = ref.read(entryFlowProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Étape 2/5 : Sentiments'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Quels sentiments sont présents en vous ?',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: feelingsData.keys.length,
              itemBuilder: (context, index) {
                final category = feelingsData.keys.elementAt(index);
                final feelings = feelingsData[category]!;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    elevation: 0,
                    color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(category, style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            children: feelings.map((feeling) {
                              final isSelected = selectedFeelings.contains(feeling);
                              return ChoiceChip(
                                label: Text(feeling),
                                selected: isSelected,
                                onSelected: (selected) {
                                  if (selected) {
                                    notifier.addFeeling(feeling);
                                  } else {
                                    notifier.removeFeeling(feeling);
                                  }
                                },
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                context.go('/journal/add/need');
              },
              child: const Text('Suivant'),
            ),
          ),
        ],
      ),
    );
  }
}
