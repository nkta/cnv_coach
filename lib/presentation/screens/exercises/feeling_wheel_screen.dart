import 'dart:math';

import 'package:cnv_coach/core/constants/cnv_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeelingWheelScreen extends StatefulWidget {
  const FeelingWheelScreen({super.key});

  @override
  State<FeelingWheelScreen> createState() => _FeelingWheelScreenState();
}

class _FeelingWheelScreenState extends State<FeelingWheelScreen> {
  final Random _random = Random();
  String? _currentFamily;
  Map<String, String>? _currentFeeling;

  void _spinWheel() {
    final families = feelingsData.keys.toList();
    if (families.isEmpty) return;
    final family = families[_random.nextInt(families.length)];
    final feelings = feelingsData[family]!;
    final feeling = feelings[_random.nextInt(feelings.length)];
    setState(() {
      _currentFamily = family;
      _currentFeeling = feeling;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('La Roue des Sentiments'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.go('/exercises'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Explorez un sentiment au hasard pour enrichir votre vocabulaire émotionnel.',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: _currentFeeling == null
                    ? Text(
                        'Appuyez sur le bouton pour lancer la roue !',
                        style: theme.textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      )
                    : Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _currentFamily!,
                                style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.primary),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                _currentFeeling!['name']!,
                                style: theme.textTheme.headlineMedium,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                _currentFeeling!['definition']!,
                                style: theme.textTheme.bodyLarge,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _spinWheel,
              icon: const Icon(Icons.casino),
              label: Text(_currentFeeling == null ? 'Lancer la roue' : 'Explorer un autre sentiment'),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: _currentFeeling == null
                  ? null
                  : () {
                      final familyFeelings = List<Map<String, String>>.from(
                        feelingsData[_currentFamily] ?? <Map<String, String>>[],
                      );
                      if (familyFeelings.isEmpty) return;
                      familyFeelings.shuffle(_random);
                      final suggestions = familyFeelings
                          .where((feeling) => feeling['name'] != _currentFeeling!['name'])
                          .take(3)
                          .map((feeling) => '• ${feeling['name']}')
                          .join('\n');
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Dans la même famille « $_currentFamily »'),
                          content: Text(suggestions.isEmpty
                              ? 'Explorez le dictionnaire des sentiments pour en découvrir d\'autres !'
                              : suggestions),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Fermer'),
                            ),
                          ],
                        ),
                      );
                    },
              child: const Text('Voir d\'autres nuances'),
            ),
          ],
        ),
      ),
    );
  }
}
