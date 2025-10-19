// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:cnv_coach/main.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('fr_FR', null);
  });

  testWidgets('Home screen affiche les principales actions', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('CNV Coach'), findsOneWidget);
    expect(find.text('Nouvelle pratique'), findsOneWidget);
    expect(find.text('Planifier mes actions'), findsOneWidget);
    expect(find.text('Consulter mon journal'), findsOneWidget);
  });
}
