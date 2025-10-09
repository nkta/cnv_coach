import 'package:cnv_coach/core/theme.dart';
import 'package:cnv_coach/presentation/screens/entry_flow/1_observation_screen.dart';
import 'package:cnv_coach/presentation/screens/entry_flow/2_feeling_screen.dart';
import 'package:cnv_coach/presentation/screens/entry_flow/3_need_screen.dart';
import 'package:cnv_coach/presentation/screens/entry_flow/4_demand_screen.dart';
import 'package:cnv_coach/presentation/screens/entry_flow/5_summary_screen.dart';
import 'package:cnv_coach/presentation/widgets/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'presentation/screens/exercises_screen.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/journal_screen.dart';
import 'presentation/screens/resources_screen.dart';

import 'data/services/journal_service.dart';
import 'presentation/providers/journal_providers.dart';

void main() async {
  // Assurer l'initialisation des bindings Flutter
  WidgetsFlutterBinding.ensureInitialized();

  // Initialiser Hive pour le stockage local
  await Hive.initFlutter();

  // Créer et initialiser le service de journal
  final journalService = JournalService();
  await journalService.init();

  runApp(
    ProviderScope(
      overrides: [
        // Fournir l'instance initialisée du service au provider
        journalServiceProvider.overrideWithValue(journalService),
      ],
      child: const MyApp(),
    ),
  );
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return MainScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/journal',
          builder: (context, state) => const JournalScreen(),
        ),
        GoRoute(
          path: '/exercises',
          builder: (context, state) => const ExercisesScreen(),
        ),
        GoRoute(
          path: '/resources',
          builder: (context, state) => const ResourcesScreen(),
        ),
      ],
    ),
    // --- Parcours de création d'une entrée ---
    GoRoute(
      path: '/journal/add/observation',
      builder: (context, state) => const ObservationScreen(),
    ),
    GoRoute(
      path: '/journal/add/feeling',
      builder: (context, state) => const FeelingScreen(),
    ),
    GoRoute(
      path: '/journal/add/need',
      builder: (context, state) => const NeedScreen(),
    ),
    GoRoute(
      path: '/journal/add/demand',
      builder: (context, state) => const DemandScreen(),
    ),
    GoRoute(
      path: '/journal/add/summary',
      builder: (context, state) => const SummaryScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CNV Coach',
      theme: AppTheme.lightTheme,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}