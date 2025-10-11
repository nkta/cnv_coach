import 'package:cnv_coach/core/constants/exercises_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MagicWandScreen extends StatefulWidget {
  const MagicWandScreen({super.key});

  @override
  State<MagicWandScreen> createState() => _MagicWandScreenState();
}

class _MagicWandScreenState extends State<MagicWandScreen> {
  late final List<MagicWandScenario> _scenarios = List.of(magicWandData)..shuffle();
  int _currentIndex = 0;
  int _score = 0;
  String? _selectedRequest;
  bool _finished = false;

  MagicWandScenario get _currentScenario => _scenarios[_currentIndex];

  void _selectRequest(String request) {
    if (_selectedRequest != null) return;
    if (request == _currentScenario.correctRequest) {
      _score++;
    }
    setState(() {
      _selectedRequest = request;
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
        _selectedRequest = null;
      });
    }
  }

  void _restart() {
    setState(() {
      _scenarios.shuffle();
      _currentIndex = 0;
      _score = 0;
      _selectedRequest = null;
      _finished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('La Baguette Magique'),
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
          'Transformez la plainte en demande concrète.',
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Plainte',
                  style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.primary),
                ),
                const SizedBox(height: 8),
                Text(
                  _currentScenario.complaint,
                  style: theme.textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        ..._currentScenario.requestOptions.map((request) {
          final bool isSelected = _selectedRequest == request;
          final bool isCorrect = request == _currentScenario.correctRequest;
          Color? background;
          Color? foreground;
          if (_selectedRequest != null) {
            if (isCorrect) {
              background = theme.colorScheme.primaryContainer;
              foreground = theme.colorScheme.onPrimaryContainer;
            } else if (isSelected) {
              background = theme.colorScheme.errorContainer;
              foreground = theme.colorScheme.onErrorContainer;
            }
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: FilledButton.tonal(
              onPressed: _selectedRequest == null ? () => _selectRequest(request) : null,
              style: FilledButton.styleFrom(
                alignment: Alignment.centerLeft,
                backgroundColor: background,
                foregroundColor: foreground,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              ),
              child: Text(request, textAlign: TextAlign.left),
            ),
          );
        }),
        const SizedBox(height: 12),
        if (_selectedRequest != null) ...[
          Card(
            color: theme.colorScheme.surfaceVariant,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _selectedRequest == _currentScenario.correctRequest
                        ? 'C\'est gagné !'
                        : 'À reformuler…',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(_currentScenario.tip, style: theme.textTheme.bodyMedium),
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
              label: Text(_currentIndex == _scenarios.length - 1 ? 'Voir les résultats' : 'Situation suivante'),
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
          Text('Demandes alignées : $_score / ${_scenarios.length}', style: theme.textTheme.titleLarge),
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
