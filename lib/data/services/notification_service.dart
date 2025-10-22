import 'dart:async';

import 'package:cnv_coach/data/models/calendar_event.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// Encapsulates local notification scheduling for calendar events.
class NotificationService {
  NotificationService() : _plugin = FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;
  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) {
      return;
    }

    tz.initializeTimeZones();

    const initSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
      macOS: DarwinInitializationSettings(),
    );

    await _plugin.initialize(initSettings);

    if (!kIsWeb) {
      final androidImplementation =
          _plugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      await androidImplementation?.createNotificationChannel(
        const AndroidNotificationChannel(
          'cnv_calendar',
          'Actions planifiées',
          description: 'Rappels pour les actions du calendrier CNV Coach.',
          importance: Importance.high,
        ),
      );
    }

    _initialized = true;
  }

  Future<bool> requestPermissions() async {
    final ios =
        _plugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>();
    final macOS = _plugin.resolvePlatformSpecificImplementation<
        MacOSFlutterLocalNotificationsPlugin>();

    final requests = <Future<bool?>>[];

    if (ios != null) {
      requests.add(ios.requestPermissions(alert: true, badge: true, sound: true));
    }
    if (macOS != null) {
      requests.add(macOS.requestPermissions(alert: true, badge: true, sound: true));
    }

    if (requests.isEmpty) {
      return true;
    }

    final results = await Future.wait(requests);
    return results.every((value) => value != false);
  }

  Future<void> scheduleForEvent(CalendarEvent event) async {
    if (!_initialized) {
      await init();
    }

    final next = event.nextOccurrence();
    final tzTime = tz.TZDateTime.from(next, tz.local);

    final details = NotificationDetails(
      android: AndroidNotificationDetails(
        'cnv_calendar',
        'Actions planifiées',
        channelDescription:
            'Rappels pour les actions du calendrier CNV Coach.',
        importance: Importance.high,
        priority: Priority.high,
        ticker: 'Rappel CNV',
      ),
      iOS: const DarwinNotificationDetails(),
      macOS: const DarwinNotificationDetails(),
    );

    try {
      await _plugin.zonedSchedule(
        _notificationId(event.id),
        event.title,
        event.description ?? 'Pensez à votre prochaine action CNV.',
        tzTime,
        details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: event.id,
      );
    } catch (error, stackTrace) {
      debugPrint('Notification scheduling failed for ${event.id}: $error');
      debugPrint(stackTrace.toString());
    }
  }

  Future<void> cancelForEvent(String eventId) async {
    if (!_initialized) {
      await init();
    }
    try {
      await _plugin.cancel(_notificationId(eventId));
    } catch (error, stackTrace) {
      debugPrint('Notification cancellation failed for $eventId: $error');
      debugPrint(stackTrace.toString());
    }
  }

  Future<void> rescheduleForEvent(CalendarEvent event) async {
    await cancelForEvent(event.id);
    await scheduleForEvent(event);
  }

  int _notificationId(String eventId) => eventId.hashCode & 0x7fffffff;
}
