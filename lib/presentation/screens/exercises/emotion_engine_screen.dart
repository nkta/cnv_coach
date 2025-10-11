import 'package:cnv_coach/core/constants/exercises_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmotionEngineScreen extends StatefulWidget {
  const EmotionEngineScreen({super.key});

  @override
  State<EmotionEngineScreen> createState() => _EmotionEngineScreenState();
}

class _EmotionEngineScreenState extends State<EmotionEngineScreen> {
  late final List<EmotionEngineItem> _items = List.of(emotionEngineData)..shuffle();
  int _currentIndex = 0;
  int _score = 0;
  String? _selectedNeed;
  bool _sessionFinished = false;

  EmotionEngineItem get _currentItem => _items[_currentIndex];

  void _selectNeed(String need) {
    if (_selectedNeed != null) return;

    final bool isCorrect = need == _currentItem.correctNeed;
    if (isCorrect) {
      _score++;
    }

    setState(() {
      _selectedNeed = need;
    });
  }

  void _goToNext() {
    if (_currentIndex == _items.length - 1) {
      setState(() {
        _sessionFinished = true;
      });
    } else {
      setState(() {
        _currentIndex++;
        _selectedNeed = null;
      });
    }
  }

  void _restart() {
    setState(() {
      _items.shuffle();
      _currentIndex = 0;
      _score = 0;
      _selectedNeed = null;
      _sessionFinished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Le Moteur des Émotions'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.go('/exercises'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _sessionFinished ? _buildResult(context) : _buildQuiz(context),
      ),
    );
  }

  Widget _buildQuiz(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Quel besoin nourrit le sentiment suivant ?',
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
                  'Sentiment',
                  style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.primary),
                ),
                const SizedBox(height: 8),
                Text(
                  _currentItem.feeling,
                  style: theme.textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: _currentItem.needsOptions.map((need) {
            final bool isSelected = _selectedNeed == need;
            final bool isCorrect = need == _currentItem.correctNeed;
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
            return FilledButton.tonal(
              onPressed: _selectedNeed == null ? () => _selectNeed(need) : null,
              style: FilledButton.styleFrom(
                backgroundColor: background,
                foregroundColor: foreground,
              ),
              child: Text(need),
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
                    _selectedNeed == _currentItem.correctNeed
                        ? 'Bien vu !'
                        : 'Presque…',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(_currentItem.explanation, style: theme.textTheme.bodyMedium),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton.icon(
              onPressed: _goToNext,
              icon: Icon(_currentIndex == _items.length - 1 ? Icons.check : Icons.arrow_forward),
              label: Text(_currentIndex == _items.length - 1 ? 'Voir les résultats' : 'Question suivante'),
            ),
          ),
        ],
        const Spacer(),
        Text(
          'Progression : ${_currentIndex + 1}/${_items.length}',
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
          Text('Score : $_score / ${_items.length}', style: theme.textTheme.titleLarge),
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
