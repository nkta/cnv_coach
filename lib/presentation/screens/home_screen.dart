import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CNV Coach'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Bienvenue !\nPrêt pour un moment avec vous-même ?',
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildNavCard(
            context,
            icon: LucideIcons.heartPulse,
            title: 'Nouvelle pratique',
            subtitle: 'Lancer le parcours d\'auto-empathie.',
            onTap: () => context.go('/journal/add/observation'),
          ),
          _buildNavCard(
            context,
            icon: LucideIcons.bookOpen,
            title: 'Consulter mon journal',
            subtitle: 'Relire vos précédentes réflexions.',
            onTap: () => context.go('/journal'),
          ),
          _buildNavCard(
            context,
            icon: LucideIcons.search,
            title: 'Explorer les ressources',
            subtitle: 'Listes des sentiments et des besoins.',
            onTap: () => context.go('/resources'),
          ),
        ],
      ),
    );
  }

  Widget _buildNavCard(BuildContext context, {required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: theme.colorScheme.primary),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.titleLarge),
                    const SizedBox(height: 4),
                    Text(subtitle, style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600])),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
