import 'package:cnv_coach/core/constants/cnv_data.dart';
import 'package:flutter/material.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const cnvSteps = [
      {
        'title': 'Observer sans juger',
        'description':
            'Décrire simplement les faits observables afin d’éviter les interprétations ou évaluations.'
      },
      {
        'title': 'Exprimer ses sentiments',
        'description':
            'Partager ce qui est vivant en soi pour clarifier son expérience émotionnelle.'
      },
      {
        'title': 'Identifier ses besoins',
        'description':
            'Relier les sentiments à des aspirations ou valeurs fondamentales.'
      },
      {
        'title': 'Formuler une demande claire',
        'description':
            'Proposer une action concrète, positive et réalisable pour prendre soin des besoins.'
      }
    ];

    const cnvPhilosophy = [
      {
        'title': 'Bienveillance radicale',
        'description':
            'Chaque être humain cherche à nourrir des besoins légitimes ; la CNV invite à accueillir cette intention plutôt que les jugements.'
      },
      {
        'title': 'Responsabilité partagée',
        'description':
            'La qualité du lien dépend de chacun ; exprimer clairement ce qui est vivant et écouter avec empathie ouvre la voie à des accords respectueux.'
      },
      {
        'title': 'Connexion avant solution',
        'description':
            'Avant de résoudre un conflit, la CNV mise sur la présence et l’écoute des sentiments et besoins afin de retrouver un terrain d’entente.'
      }
    ];

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
                  Text("Qu'est-ce que la CNV ?", style: theme.textTheme.titleLarge),
                  const SizedBox(height: 8.0),
                  Text(
                    'La Communication NonViolente (CNV) est un processus en quatre étapes pour favoriser un dialogue empathique et respectueux. Elle aide à prendre soin de la relation tout en restant attentif à ses propres besoins.',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12.0),
                  ...cnvSteps.map(
                    (step) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• ', style: theme.textTheme.bodyMedium),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: theme.textTheme.bodyMedium,
                                children: [
                                  TextSpan(
                                    text: "${step['title']} : ",
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(text: step['description']),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('La philosophie de la CNV', style: theme.textTheme.titleLarge),
                  const SizedBox(height: 8.0),
                  Text(
                    'Au-delà de la méthode, la CNV propose une vision de la relation basée sur le respect mutuel, l’empathie et la recherche de solutions gagnant-gagnant.',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12.0),
                  ...cnvPhilosophy.map(
                    (principle) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• ', style: theme.textTheme.bodyMedium),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: theme.textTheme.bodyMedium,
                                children: [
                                  TextSpan(
                                    text: "${principle['title']} : ",
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(text: principle['description']),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
