import 'dart:async';

import 'package:cnv_coach/data/models/calendar_event.dart';
import 'package:cnv_coach/data/services/calendar_service.dart';
import 'package:cnv_coach/data/services/notification_service.dart';
import 'package:cnv_coach/presentation/providers/notification_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calendarServiceProvider = Provider<CalendarService>((ref) {
  throw UnimplementedError(
    'calendarServiceProvider must be overridden in ProviderScope',
  );
});

class CalendarEventsNotifier extends StateNotifier<List<CalendarEvent>> {
  CalendarEventsNotifier(this._calendarService, this._notificationService)
      : super([]) {
    loadEvents();
    unawaited(_restoreNotifications());
  }

  final CalendarService _calendarService;
  final NotificationService _notificationService;

  Future<void> _restoreNotifications() async {
    for (final event in state) {
      await _notificationService.rescheduleForEvent(event);
    }
  }

  void loadEvents() {
    state = _calendarService.getEvents();
  }

  CalendarEvent? getById(String id) {
    try {
      return state.firstWhere((event) => event.id == id);
    } catch (_) {
      return null;
    }
  }

  Future<void> addEvent(CalendarEvent event) async {
    await _calendarService.addEvent(event);
    await _notificationService.scheduleForEvent(event);
    loadEvents();
  }

  Future<void> updateEvent(CalendarEvent event) async {
    await _calendarService.updateEvent(event);
    await _notificationService.rescheduleForEvent(event);
    loadEvents();
  }

  Future<void> deleteEvent(String id) async {
    await _calendarService.deleteEvent(id);
    await _notificationService.cancelForEvent(id);
    loadEvents();
  }

  Future<void> setJournalEntryLink({
    required String eventId,
    String? journalEntryId,
  }) async {
    await _calendarService.setJournalEntryLink(
      eventId: eventId,
      journalEntryId: journalEntryId,
    );
    loadEvents();
  }

  Future<void> clearLinksForJournalEntry(String journalEntryId) async {
    await _calendarService.clearLinksForJournalEntry(journalEntryId);
    loadEvents();
  }
}

final calendarEventsProvider =
    StateNotifierProvider<CalendarEventsNotifier, List<CalendarEvent>>((ref) {
      final service = ref.watch(calendarServiceProvider);
      final notificationService = ref.watch(notificationServiceProvider);
      return CalendarEventsNotifier(service, notificationService);
    });
