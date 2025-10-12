import 'package:cnv_coach/core/constants/cnv_data.dart';
import 'package:cnv_coach/presentation/providers/entry_flow_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NeedScreen extends ConsumerStatefulWidget {
  const NeedScreen({super.key});

  @override
  ConsumerState<NeedScreen> createState() => _NeedScreenState();
}

class _NeedScreenState extends ConsumerState<NeedScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final selectedNeeds = ref.watch(entryFlowProvider.select((state) => state.needs));
    final selectedNeedsSet = selectedNeeds.toSet();
    final notifier = ref.read(entryFlowProvider.notifier);

    final query = _searchQuery.toLowerCase();
    final filteredNeeds = needsData
        .where((need) {
          final name = need['name'] ?? '';
          final definition = need['definition'] ?? '';
          return name.toLowerCase().contains(query) ||
              definition.toLowerCase().contains(query);
        })
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Étape 3/5 : Besoin'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quels besoins n\'étaient pas satisfaits ?',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                SearchBar(
                  hintText: 'Rechercher un besoin...',
                  onChanged: (query) {
                    setState(() {
                      _searchQuery = query;
                    });
                  },
                  leading: const Icon(Icons.search),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredNeeds.length,
              itemBuilder: (context, index) {
                final need = filteredNeeds[index];
                final needName = need['name'] ?? '';
                final needDefinition = need['definition'];
                final isSelected = selectedNeedsSet.contains(needName);
                return CheckboxListTile(
                  key: ValueKey(needName),
                  title: Text(needName),
                  subtitle: (needDefinition != null && needDefinition.isNotEmpty)
                      ? Text(needDefinition)
                      : null,
                  value: isSelected,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (_) => notifier.toggleNeed(needName),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: selectedNeeds.isEmpty
                  ? null
                  : () {
                      context.go('/journal/add/demand');
                    },
              child: const Text('Suivant'),
            ),
          ),
        ],
      ),
    );
  }
}
