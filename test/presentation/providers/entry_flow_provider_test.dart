import 'package:cnv_coach/presentation/providers/entry_flow_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EntryFlowNotifier', () {
    test('toggleNeed allows selecting multiple unique needs', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(entryFlowProvider.notifier);

      notifier.toggleNeed('Acceptation');
      notifier.toggleNeed('Affection');

      final needs = container.read(entryFlowProvider).needs;
      expect(needs, containsAll(<String>['Acceptation', 'Affection']));
    });

    test('toggleNeed removes an already selected need', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(entryFlowProvider.notifier);

      notifier.toggleNeed('Acceptation');
      notifier.toggleNeed('Acceptation');

      final needs = container.read(entryFlowProvider).needs;
      expect(needs, isEmpty);
    });
  });
}
