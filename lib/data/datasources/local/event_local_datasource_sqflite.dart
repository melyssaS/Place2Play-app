import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loggy/loggy.dart';
import 'package:path/path.dart';
import 'package:place_2_play/domain/entities/event.dart';
import 'package:sqflite/sqflite.dart';
import 'package:place_2_play/data/utils/models.dart';

class EventLocalDataSource {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), 'events_databaset.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE events (id TEXT PRIMARY KEY, title TEXT, description TEXT, start TEXT, end TEXT, category TEXT, price TEXT, latitude TEXT, longitude TEXT, deporte TEXT)');

    //addAllEvents(eventsList);
  }

  Future<void> addAllEvents(List<Event> event) async {
    final db = await database;
    // aquí se debe llamar al db.insert
    // ignore: avoid_function_literals_in_foreach_calls
    event.forEach((element) async {
      await db.insert(
        'events',
        element.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<int> getAllElements() async {
    final db = await database;
    return Future.value(Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM events')));
  }

  Future<void> addEvent(Event event) async {
    final db = await database;
    await db.insert(
      'events',
      event.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteEvent(Event event) async {
    final db = await database;
    await db.delete('events', where: "id = ?", whereArgs: ["id"]);
  }

  Future<void> updateEvent(Event event) async {
    final db = await database;
    await db.update('events', event.toMap(),
        where: "id = ?", whereArgs: [event.id]);
  }

  Future<List<Event>> getEvensByCategory(String category) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("events",
        columns: ["category"], where: "category = ?", whereArgs: ["category"]);

    return List.generate(maps.length, (i) {
      //keep in mind the index
      return Event(
          id: maps[i]['id'],
          start: DateTime.parse(maps[i]['start']),
          end: DateTime.parse(maps[i]['end']),
          title: maps[i]['title'],
          price: maps[i]['price'],
          description: maps[i]['description'],
          category: maps[i]['category'],
          address: maps[i]['latitude']['longitude'],
          deporte: maps[i]['deporte']);
    });
  }

  Future<List<Event>> getAllEvents() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('events');
    return List.generate(maps.length, (i) {
      //keep in mind the index
      return Event(
          id: maps[i]['id'],
          start: DateTime.parse(maps[i]['start']),
          end: DateTime.parse(maps[i]['end']),
          title: maps[i]['title'],
          price: double.parse(maps[i]['price']),
          description: maps[i]['description'],
          category: maps[i]['category'].contains('history')
              ? UserCategory.history
              : maps[i]['category'].contains('created')
                  ? UserCategory.created
                  : UserCategory.starred,
          address: LatLng(double.parse(maps[i]['latitude']),
              double.parse(maps[i]['longitude'])),
          deporte: maps[i]['deporte']);
    });
  }

  Future<Event> getEvent(Event event) async {
    final db = await database;

    final List<Map<String, dynamic>> maps =
        await db.query('events', where: "id = ?", whereArgs: ["id"]);

    //keep in mind the index
    return Event(
        id: maps[0]['id'],
        start: DateTime.parse(maps[0]['start']),
        end: DateTime.parse(maps[0]['end']),
        title: maps[0]['title'],
        price: maps[0]['price'],
        description: maps[0]['description'],
        category: maps[0]['category'],
        address: maps[0]['latitude']['longitude'],
        deporte: maps[0]['deporte']);
  }

  Future<void> deleteAll() async {
    Database db = await database;
    await db.delete('events');
  }
}
