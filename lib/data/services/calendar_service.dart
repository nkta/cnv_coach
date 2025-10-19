import 'package:cnv_coach/data/models/calendar_event.dart';
import 'package:hive/hive.dart';

class CalendarService {
  late final Box<CalendarEvent> _eventsBox;

  Future<void> init() async {
    if (!Hive.isAdapterRegistered(CalendarEventAdapter().typeId)) {
      Hive.registerAdapter(CalendarEventAdapter());
    }

    _eventsBox = await Hive.openBox<CalendarEvent>('calendar_events');
  }

  List<CalendarEvent> getEvents() {
    final events = _eventsBox.values.toList();
    events.sort((a, b) => a.nextOccurrence().compareTo(b.nextOccurrence()));
    return events;
  }

  CalendarEvent? getEventById(String id) {
    return _eventsBox.get(id);
  }

  Future<void> addEvent(CalendarEvent event) async {
    await _eventsBox.put(event.id, event);
  }

  Future<void> deleteEvent(String id) async {
    await _eventsBox.delete(id);
  }

  Future<void> updateEvent(CalendarEvent event) async {
    await _eventsBox.put(event.id, event);
  }

  Future<void> setJournalEntryLink({
    required String eventId,
    String? journalEntryId,
  }) async {
    final existing = _eventsBox.get(eventId);
    if (existing == null) {
      return;
    }

    if (existing.linkedJournalEntryId == journalEntryId) {
      return;
    }

    final updated = existing.copyWith(
      linkedJournalEntryId: journalEntryId,
      clearLinkedJournalEntry: journalEntryId == null,
    );

    await _eventsBox.put(eventId, updated);
  }

  Future<void> clearLinksForJournalEntry(String journalEntryId) async {
    final eventsToUpdate = _eventsBox.values
        .where((event) => event.linkedJournalEntryId == journalEntryId)
        .toList();

    for (final event in eventsToUpdate) {
      await _eventsBox.put(
        event.id,
        event.copyWith(clearLinkedJournalEntry: true),
      );
    }
  }

  Future<void> close() async {
    await _eventsBox.close();
  }
}
