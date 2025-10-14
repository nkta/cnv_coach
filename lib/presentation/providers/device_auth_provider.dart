import 'package:cnv_coach/data/services/device_auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deviceAuthServiceProvider = Provider<DeviceAuthService>((ref) {
  throw UnimplementedError('deviceAuthServiceProvider must be overridden');
});

enum DeviceAuthStatus { unknown, authenticating, authenticated, failed }

class DeviceAuthController extends StateNotifier<DeviceAuthStatus> {
  DeviceAuthController(this._service) : super(DeviceAuthStatus.unknown);

  final DeviceAuthService _service;

  Future<bool>? _inFlight;

  Future<bool> authenticate() async {
    if (state == DeviceAuthStatus.authenticated) {
      return true;
    }

    if (_inFlight != null) {
      return _inFlight!;
    }

    Future<bool> runAuthentication() async {
      state = DeviceAuthStatus.authenticating;

      try {
        final supported = await _service.isDeviceSupported();
        if (!supported) {
          state = DeviceAuthStatus.authenticated;
          return true;
        }

        final canCheck = await _service.canCheckBiometrics();
        if (!canCheck) {
          state = DeviceAuthStatus.authenticated;
          return true;
        }

        final success = await _service.authenticate();
        state = success ? DeviceAuthStatus.authenticated : DeviceAuthStatus.failed;
        return success;
      } catch (_) {
        state = DeviceAuthStatus.failed;
        return false;
      } finally {
        _inFlight = null;
      }
    }

    _inFlight = runAuthentication();
    return _inFlight!;
  }

  void reset() {
    state = DeviceAuthStatus.unknown;
  }

  void grantTemporaryAccess() {
    state = DeviceAuthStatus.authenticated;
  }
}

final deviceAuthControllerProvider =
    StateNotifierProvider<DeviceAuthController, DeviceAuthStatus>((ref) {
  final service = ref.watch(deviceAuthServiceProvider);
  return DeviceAuthController(service);
});
