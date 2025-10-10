import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercices Pratiques'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          _buildExerciseCard(
            context,
            title: 'Le Tri des Faits',
            subtitle: 'Distinguer les observations des jugements.',
            icon: LucideIcons.swords,
            route: '/exercises/fact_sorting',
          ),
          _buildExerciseCard(
            context,
            title: 'Le Moteur des Émotions',
            subtitle: 'Relier un sentiment à son besoin source.',
            icon: LucideIcons.puzzle,
            route: '/exercises/emotion_engine', // TODO: Implement route
          ),
          _buildExerciseCard(
            context,
            title: 'La Baguette Magique',
            subtitle: 'Transformer une plainte en demande claire.',
            icon: LucideIcons.wand,
            route: '/exercises/magic_wand', // TODO: Implement route
          ),
          _buildExerciseCard(
            context,
            title: 'Le Détecteur d\'Empathie',
            subtitle: 'Deviner les sentiments et besoins de l\'autre.',
            icon: LucideIcons.radar,
            route: '/exercises/empathy_detector', // TODO: Implement route
          ),
          _buildExerciseCard(
            context,
            title: 'La Roue des Sentiments',
            subtitle: 'Explorer un sentiment au hasard.',
            icon: LucideIcons.refreshCw,
            route: '/exercises/feeling_wheel', // TODO: Implement route
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseCard(BuildContext context, {required String title, required String subtitle, required IconData icon, required String route}) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: InkWell(
        onTap: () => context.go(route),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Icon(icon, size: 32, color: theme.colorScheme.primary),
              const SizedBox(width: 20),
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
