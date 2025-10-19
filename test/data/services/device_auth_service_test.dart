import 'package:cnv_coach/data/services/device_auth_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mocktail/mocktail.dart';

class _MockLocalAuthentication extends Mock implements LocalAuthentication {}

void main() {
  setUpAll(() {
    registerFallbackValue(const AuthenticationOptions());
  });

  late _MockLocalAuthentication mockLocalAuth;
  late DeviceAuthService service;

  setUp(() {
    mockLocalAuth = _MockLocalAuthentication();
    service = DeviceAuthService(localAuthentication: mockLocalAuth);
  });

  test('canCheckBiometrics délègue au plugin', () async {
    when(() => mockLocalAuth.canCheckBiometrics).thenAnswer((_) async => true);

    final result = await service.canCheckBiometrics();

    expect(result, isTrue);
    verify(() => mockLocalAuth.canCheckBiometrics).called(1);
  });

  test('isDeviceSupported délègue au plugin', () async {
    when(
      () => mockLocalAuth.isDeviceSupported(),
    ).thenAnswer((_) async => false);

    final result = await service.isDeviceSupported();

    expect(result, isFalse);
    verify(() => mockLocalAuth.isDeviceSupported()).called(1);
  });

  test('authenticate retourne vrai lorsque le plugin réussit', () async {
    when(
      () => mockLocalAuth.authenticate(
        localizedReason: any(named: 'localizedReason'),
        options: any(named: 'options'),
      ),
    ).thenAnswer((_) async => true);

    final result = await service.authenticate();

    expect(result, isTrue);
    verify(
      () => mockLocalAuth.authenticate(
        localizedReason:
            'Veuillez vous authentifier pour accéder à votre journal.',
        options: any(named: 'options'),
      ),
    ).called(1);
  });

  test('authenticate retourne faux lorsque le plugin échoue', () async {
    when(
      () => mockLocalAuth.authenticate(
        localizedReason: any(named: 'localizedReason'),
        options: any(named: 'options'),
      ),
    ).thenThrow(PlatformException(code: 'not_available'));

    final result = await service.authenticate();

    expect(result, isFalse);
  });
}
