import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import '../../data/datasources/local/event_local_datasource_sqflite.dart';
import '../entities/event.dart';

// here we call the corresponding local source
class EventRepository {
  late EventLocalDataSource localDataSource;

  EventRepository() {
    logInfo("Starting EventRepository");
    localDataSource = EventLocalDataSource();
  }

  Future<void> addEvent(Event event) async {
    logInfo(await localDataSource.getAllElements());
    await localDataSource.addEvent(event);
  }

  Future<void> deleteEvent(Event event) async {
    await localDataSource.deleteEvent(event);
  }

  Future<void> updateEvent(Event event) async {
    await localDataSource.updateEvent(event);
  }

  Future<List<Event>> getEventsByCategory(String category) async =>
      await localDataSource.getEvensByCategory(category);

  Future<List<Event>> getAllEvents() async =>
      await localDataSource.getAllEvents();

  Future<Event> getEvent(Event event) async =>
      await localDataSource.getEvent(event);
}
