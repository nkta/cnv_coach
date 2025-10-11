import 'package:cnv_coach/core/theme.dart';
import 'package:cnv_coach/data/models/journal_entry.dart';
import 'package:cnv_coach/presentation/screens/entry_flow/1_observation_screen.dart';
import 'package:cnv_coach/presentation/screens/entry_flow/2_feeling_screen.dart';
import 'package:cnv_coach/presentation/screens/entry_flow/3_need_screen.dart';
import 'package:cnv_coach/presentation/screens/entry_flow/4_demand_screen.dart';
import 'package:cnv_coach/presentation/screens/entry_flow/5_summary_screen.dart';
import 'package:cnv_coach/presentation/screens/exercises/emotion_engine_screen.dart';
import 'package:cnv_coach/presentation/screens/exercises/empathy_detector_screen.dart';
import 'package:cnv_coach/presentation/screens/exercises/fact_sorting_screen.dart';
import 'package:cnv_coach/presentation/screens/exercises/feeling_wheel_screen.dart';
import 'package:cnv_coach/presentation/screens/exercises/magic_wand_screen.dart';
import 'package:cnv_coach/presentation/screens/journal_detail_screen.dart';
import 'package:cnv_coach/presentation/widgets/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'presentation/screens/exercises_screen.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/journal_screen.dart';
import 'presentation/screens/resources_screen.dart';

import 'data/services/journal_service.dart';
import 'presentation/providers/journal_providers.dart';

void main() async {
  // Assurer l'initialisation des bindings Flutter
  WidgetsFlutterBinding.ensureInitialized();

  // Initialiser le support pour le formatage des dates en français
  await initializeDateFormatting('fr_FR', null);

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
    // --- Écran de détail du journal ---
    GoRoute(
      path: '/journal/detail',
      builder: (context, state) {
        final entry = state.extra as JournalEntry?;
        if (entry != null) {
          return JournalDetailScreen(entry: entry);
        } else {
          // Gérer le cas où l'entrée est nulle, peut-être rediriger
          return const Scaffold(
            body: Center(
              child: Text('Erreur : Entrée non trouvée.'),
            ),
          );
        }
      },
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
    // --- Exercices ---
    GoRoute(
      path: '/exercises/fact_sorting',
      builder: (context, state) => const FactSortingScreen(),
    ),
    GoRoute(
      path: '/exercises/emotion_engine',
      builder: (context, state) => const EmotionEngineScreen(),
    ),
    GoRoute(
      path: '/exercises/magic_wand',
      builder: (context, state) => const MagicWandScreen(),
    ),
    GoRoute(
      path: '/exercises/empathy_detector',
      builder: (context, state) => const EmpathyDetectorScreen(),
    ),
    GoRoute(
      path: '/exercises/feeling_wheel',
      builder: (context, state) => const FeelingWheelScreen(),
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