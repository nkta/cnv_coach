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
            child: ExpansionTile(
              title: Text('Bibliothèque des sentiments', style: theme.textTheme.titleLarge),
              children: feelingsData.entries.map((category) {
                return ExpansionTile(
                  title: Text(category.key, style: theme.textTheme.titleMedium),
                  children: category.value.map((feeling) {
                    return ListTile(
                      title: Text(feeling),
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
                  title: Text(need),
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
