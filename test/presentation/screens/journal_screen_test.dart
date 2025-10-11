import 'package:cnv_coach/data/models/journal_entry.dart';
import 'package:cnv_coach/data/services/device_auth_service.dart';
import 'package:cnv_coach/presentation/providers/device_auth_provider.dart';
import 'package:cnv_coach/presentation/providers/journal_providers.dart';
import 'package:cnv_coach/presentation/screens/journal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class _MockLocalAuthentication extends Mock implements LocalAuthentication {}

class _FakeJournalEntriesNotifier extends StateNotifier<List<JournalEntry>> {
  _FakeJournalEntriesNotifier(List<JournalEntry> initial) : super(initial);
}

void main() {
  setUpAll(() {
    registerFallbackValue(const AuthenticationOptions());
  });

  testWidgets('affiche les entrées lorsque l\'authentification réussit', (tester) async {
    final mockLocalAuth = _MockLocalAuthentication();

    when(() => mockLocalAuth.isDeviceSupported()).thenAnswer((_) async => true);
    when(() => mockLocalAuth.canCheckBiometrics).thenAnswer((_) async => true);
    when(() => mockLocalAuth.authenticate(
          localizedReason: any(named: 'localizedReason'),
          options: any(named: 'options'),
        )).thenAnswer((_) async => true);

    final entries = [
      JournalEntry(
        observation: 'Observation test',
        feelings: const ['joie'],
        need: 'Besoin',
        demand: 'Demande',
      ),
    ];

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          deviceAuthServiceProvider.overrideWithValue(
            DeviceAuthService(localAuthentication: mockLocalAuth),
          ),
          journalEntriesProvider.overrideWith((ref) => _FakeJournalEntriesNotifier(entries)),
        ],
        child: const MaterialApp(
          home: JournalScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Observation test'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('affiche l\'écran verrouillé lorsque l\'authentification échoue', (tester) async {
    final mockLocalAuth = _MockLocalAuthentication();

    when(() => mockLocalAuth.isDeviceSupported()).thenAnswer((_) async => true);
    when(() => mockLocalAuth.canCheckBiometrics).thenAnswer((_) async => true);
    when(() => mockLocalAuth.authenticate(
          localizedReason: any(named: 'localizedReason'),
          options: any(named: 'options'),
        )).thenAnswer((_) async => false);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          deviceAuthServiceProvider.overrideWithValue(
            DeviceAuthService(localAuthentication: mockLocalAuth),
          ),
          journalEntriesProvider.overrideWith((ref) => _FakeJournalEntriesNotifier(const [])),
        ],
        child: const MaterialApp(
          home: JournalScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Accès verrouillé'), findsOneWidget);
    expect(find.text("Retour à l'accueil"), findsOneWidget);
    expect(find.text('Réessayer'), findsOneWidget);
  });
}
