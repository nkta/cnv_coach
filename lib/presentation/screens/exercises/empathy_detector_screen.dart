import 'package:cnv_coach/core/constants/exercises_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmpathyDetectorScreen extends StatefulWidget {
  const EmpathyDetectorScreen({super.key});

  @override
  State<EmpathyDetectorScreen> createState() => _EmpathyDetectorScreenState();
}

class _EmpathyDetectorScreenState extends State<EmpathyDetectorScreen> {
  late final List<EmpathyDetectorScenario> _scenarios = List.of(empathyDetectorData)..shuffle();
  int _currentIndex = 0;
  int _score = 0;
  String? _selectedFeeling;
  String? _selectedNeed;
  bool _finished = false;

  EmpathyDetectorScenario get _currentScenario => _scenarios[_currentIndex];

  void _selectFeeling(String feeling) {
    if (_selectedFeeling != null) return;
    setState(() {
      _selectedFeeling = feeling;
    });
  }

  void _selectNeed(String need) {
    if (_selectedNeed != null || _selectedFeeling == null) return;
    setState(() {
      _selectedNeed = need;
      if (_selectedFeeling == _currentScenario.correctFeeling && need == _currentScenario.correctNeed) {
        _score++;
      }
    });
  }

  void _next() {
    if (_currentIndex == _scenarios.length - 1) {
      setState(() {
        _finished = true;
      });
    } else {
      setState(() {
        _currentIndex++;
        _selectedFeeling = null;
        _selectedNeed = null;
      });
    }
  }

  void _restart() {
    setState(() {
      _scenarios.shuffle();
      _currentIndex = 0;
      _score = 0;
      _selectedFeeling = null;
      _selectedNeed = null;
      _finished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Le Détecteur d\'Empathie'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.go('/exercises'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _finished ? _buildResult(context) : _buildExercise(context),
      ),
    );
  }

  Widget _buildExercise(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Choisissez le sentiment puis le besoin que vous entendez.',
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Message', style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.primary)),
                const SizedBox(height: 8),
                Text(
                  '« ${_currentScenario.statement} »',
                  style: theme.textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text('Sentiments possibles', style: theme.textTheme.labelLarge),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: _currentScenario.feelingOptions.map((feeling) {
            final bool isSelected = _selectedFeeling == feeling;
            final bool isCorrect = feeling == _currentScenario.correctFeeling;
            Color? background;
            Color? foreground;
            if (_selectedFeeling != null) {
              if (isCorrect) {
                background = theme.colorScheme.primaryContainer;
                foreground = theme.colorScheme.onPrimaryContainer;
              } else if (isSelected) {
                background = theme.colorScheme.errorContainer;
                foreground = theme.colorScheme.onErrorContainer;
              }
            }
            return ChoiceChip(
              label: Text(feeling),
              selected: isSelected,
              onSelected: _selectedFeeling == null ? (_) => _selectFeeling(feeling) : null,
              backgroundColor: background,
              selectedColor: background,
              labelStyle: TextStyle(color: foreground),
            );
          }).toList(),
        ),
        const SizedBox(height: 24),
        Text('Besoins possibles', style: theme.textTheme.labelLarge),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: _currentScenario.needOptions.map((need) {
            final bool isSelected = _selectedNeed == need;
            final bool isCorrect = need == _currentScenario.correctNeed;
            Color? background;
            Color? foreground;
            if (_selectedNeed != null) {
              if (isCorrect) {
                background = theme.colorScheme.primaryContainer;
                foreground = theme.colorScheme.onPrimaryContainer;
              } else if (isSelected) {
                background = theme.colorScheme.errorContainer;
                foreground = theme.colorScheme.onErrorContainer;
              }
            }
            return ChoiceChip(
              label: Text(need),
              selected: isSelected,
              onSelected: (_selectedNeed == null && _selectedFeeling != null) ? (_) => _selectNeed(need) : null,
              backgroundColor: background,
              selectedColor: background,
              labelStyle: TextStyle(color: foreground),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        if (_selectedNeed != null) ...[
          Card(
            color: theme.colorScheme.surfaceVariant,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _selectedFeeling == _currentScenario.correctFeeling &&
                            _selectedNeed == _currentScenario.correctNeed
                        ? 'Empathie réussie !'
                        : 'Continuez d\'écouter…',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(_currentScenario.explanation, style: theme.textTheme.bodyMedium),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton.icon(
              onPressed: _next,
              icon: Icon(_currentIndex == _scenarios.length - 1 ? Icons.check : Icons.arrow_forward),
              label: Text(_currentIndex == _scenarios.length - 1 ? 'Voir les résultats' : 'Message suivant'),
            ),
          ),
        ],
        const Spacer(),
        Text(
          'Progression : ${_currentIndex + 1}/${_scenarios.length}',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildResult(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Exercice terminé !', style: theme.textTheme.headlineMedium),
          const SizedBox(height: 16),
          Text('Empathies justes : $_score / ${_scenarios.length}', style: theme.textTheme.titleLarge),
          const SizedBox(height: 32),
          FilledButton.icon(
            onPressed: _restart,
            icon: const Icon(Icons.refresh),
            label: const Text('Rejouer'),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () => context.go('/exercises'),
            child: const Text('Retour aux exercices'),
          ),
        ],
      ),
    );
  }
}
