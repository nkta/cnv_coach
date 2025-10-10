import 'package:cnv_coach/core/constants/cnv_data.dart';
import 'package:flutter/material.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ressources'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Qu'est-ce que la CNV ?",
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'La Communication NonViolente invite à observer une situation sans jugement, à nommer les sentiments ressentis, à identifier les besoins sous-jacents puis à formuler une demande claire. Cette approche, popularisée par Marshall B. Rosenberg, encourage un dialogue empathique et la recherche de solutions coopératives.',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: ExpansionTile(
              title: Text('Bibliothèque des sentiments', style: theme.textTheme.titleLarge),
              children: feelingsData.entries.map((category) {
                return ExpansionTile(
                  title: Text(category.key, style: theme.textTheme.titleMedium),
                  children: category.value.map((feeling) {
                    return ListTile(
                      title: Text(feeling['name']!),
                      subtitle: Text(feeling['definition']!),
                      dense: true,
                    );
                  }).toList(),
                );
              }).toList(),
            ),
          ),
          Card(
            child: ExpansionTile(
              title: Text('Bibliothèque des besoins', style: theme.textTheme.titleLarge),
              children: needsData.map((need) {
                return ListTile(
                  title: Text(need['name']!),
                  subtitle: Text(need['definition']!),
                  dense: true,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
