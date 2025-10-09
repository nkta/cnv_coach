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
    final selectedNeed = ref.watch(entryFlowProvider).need;
    final notifier = ref.read(entryFlowProvider.notifier);

    final filteredNeeds = needsData
        .where((need) =>
            need.toLowerCase().contains(_searchQuery.toLowerCase()))
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
                  'Quel besoin n\'était pas satisfait ?',
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
                return RadioListTile<String>(
                  title: Text(need),
                  value: need,
                  groupValue: selectedNeed,
                  onChanged: (value) {
                    if (value != null) {
                      notifier.setNeed(value);
                    }
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: selectedNeed == null
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
