import 'package:flutter/material.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercices'),
      ),
      body: const Center(
        child: Text('Écran des exercices'),
      ),
    );
  }
}
