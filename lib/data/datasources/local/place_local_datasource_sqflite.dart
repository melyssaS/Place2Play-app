import 'dart:async';
import 'package:path/path.dart';
import 'package:place_2_play/domain/entities/place.dart';
import 'package:sqflite/sqflite.dart';

class PlaceLocalDataSource {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), 'places_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE places (id TEXT PRIMARY KEY, latitude TEXT, longitude TEXT,name TEXT, category TEXT, opennow TEXT, address TEXT, img TEXT)');
  }

  Future<void> addAllPlaces(List<Place> places) async {
    final db = await database;
    // aquí se debe llamar al db.insert
    // ignore: avoid_function_literals_in_foreach_calls
    places.forEach((element) async {
      await db.insert(
        'places',
        element.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<void> addPlace(Place place) async {
    final db = await database;
    await db.insert(
      'places',
      place.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deletePlace(Place place) async {
    final db = await database;
    await db.delete('places', where: "id = ?", whereArgs: ["id"]);
  }

  Future<void> updatePlace(Place place) async {
    final db = await database;
    await db.update('places', place.toMap(),
        where: "id = ?", whereArgs: [place.id]);
  }

  Future<List<Place>> getAllPlaces() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('places');
    return List.generate(maps.length, (i) {
      //keep in mind the index
      return Place(
        id: maps[i]['id'],
        // latLng: LatLng(double.parse(maps[i]['latitude']),
        //   double.parse(maps[i]['longitude'])),
        name: maps[i]['name'],
        address: maps[i]['address'],
        img: maps[i]['img'],
      );
    });
  }

  Future<void> deleteAll() async {
    Database db = await database;
    await db.delete('places');
  }
}
