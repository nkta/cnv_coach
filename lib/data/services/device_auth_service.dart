import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

/// Service d'authentification biométrique de l'appareil.
///
/// Cette classe encapsule le plugin [LocalAuthentication] pour
/// faciliter les tests unitaires et centraliser la gestion des erreurs.
class DeviceAuthService {
  DeviceAuthService({LocalAuthentication? localAuthentication})
      : _localAuthentication = localAuthentication ?? LocalAuthentication();

  final LocalAuthentication _localAuthentication;

  /// Vérifie si des biométries sont configurées sur l'appareil.
  Future<bool> canCheckBiometrics() {
    return _localAuthentication.canCheckBiometrics;
  }

  /// Vérifie si l'appareil supporte l'authentification biométrique.
  Future<bool> isDeviceSupported() {
    return _localAuthentication.isDeviceSupported();
  }

  /// Lance une authentification biométrique.
  ///
  /// Retourne `true` si l'utilisateur s'est authentifié avec succès,
  /// sinon `false`.
  Future<bool> authenticate({
    String localizedReason =
        'Veuillez vous authentifier pour accéder à votre journal.',
  }) async {
    try {
      return await _localAuthentication.authenticate(
        localizedReason: localizedReason,
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
        ),
      );
    } on PlatformException {
      return false;
    }
  }
}
