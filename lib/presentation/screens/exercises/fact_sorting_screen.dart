import 'dart:math';
import 'package:cnv_coach/core/constants/exercises_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FactSortingScreen extends StatefulWidget {
  const FactSortingScreen({super.key});

  @override
  State<FactSortingScreen> createState() => _FactSortingScreenState();
}

class _FactSortingScreenState extends State<FactSortingScreen> {
  late List<FactSortingItem> _cards;
  int _currentIndex = 0;
  int _score = 0;
  bool _sessionFinished = false;

  @override
  void initState() {
    super.initState();
    _cards = _generateCards();
  }

  List<FactSortingItem> _generateCards() {
    final cards = List<FactSortingItem>.from(factSortingData)..shuffle();
    return cards.take(10).toList();
  }

  void _handleAnswer(JudgmentType answer) {
    bool isCorrect = _cards[_currentIndex].type == answer;
    if (isCorrect) {
      _score++;
    }

    setState(() {
      if (_currentIndex < _cards.length - 1) {
        _currentIndex++;
      } else {
        _sessionFinished = true;
      }
    });
  }

  void _resetGame() {
    setState(() {
      _cards = _generateCards();
      _currentIndex = 0;
      _score = 0;
      _sessionFinished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Le Tri des Faits'),
        leading: IconButton(icon: const Icon(Icons.close), onPressed: () => context.go('/exercises')),
      ),
      body: _sessionFinished ? _buildResultScreen() : _buildGameScreen(),
    );
  }

  Widget _buildGameScreen() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Observation ou Jugement ?', style: Theme.of(context).textTheme.headlineSmall),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Exercice ${_currentIndex + 1} sur ${_cards.length}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: List.generate(_cards.length, (index) {
              if (index < _currentIndex) return const SizedBox.shrink();

              final item = _cards[index];
              final isTopCard = index == _currentIndex;

              return Draggable<JudgmentType>(
                data: item.type,
                feedback: Transform.rotate(
                  angle: pi / 12,
                  child: _buildCard(item, isTopCard: false),
                ),
                childWhenDragging: const SizedBox.shrink(),
                onDragEnd: (details) {
                  if (details.offset.dx.abs() < 100) return; // Not dragged far enough
                  final answer = details.offset.dx > 0 ? JudgmentType.observation : JudgmentType.judgment;
                  _handleAnswer(answer);
                },
                child: _buildCard(item, isTopCard: isTopCard),
              );
            }).reversed.toList(),
          ),
        ),
        _buildInstructions(),
      ],
    );
  }

  Widget _buildCard(FactSortingItem item, {required bool isTopCard}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Card(
        elevation: isTopCard ? 4 : 2,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              item.sentence,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInstructions() {
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [Icon(Icons.arrow_back), Text(' Jugement')]),
          Row(children: [Text('Observation '), Icon(Icons.arrow_forward)]),
        ],
      ),
    );
  }

  Widget _buildResultScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Exercice terminé !', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 24),
          Text('Votre score : $_score / ${_cards.length}', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            icon: const Icon(Icons.refresh),
            label: const Text('Recommencer'),
            onPressed: _resetGame,
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => context.go('/exercises'),
            child: const Text('Retour au menu des exercices'),
          ),
        ],
      ),
    );
  }
}
