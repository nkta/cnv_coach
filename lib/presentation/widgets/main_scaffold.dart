import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({required this.child, super.key});

  final Widget child;

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/journal')) {
      return 1;
    }
    if (location.startsWith('/exercises')) {
      return 2;
    }
    if (location.startsWith('/resources')) {
      return 3;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/journal');
        break;
      case 2:
        context.go('/exercises');
        break;
      case 3:
        context.go('/resources');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.bookOpen),
            label: 'Journal',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.brainCircuit),
            label: 'Exercices',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.lightbulb),
            label: 'Ressources',
          ),
        ],
      ),
    );
  }
}
