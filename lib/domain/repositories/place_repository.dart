import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:place_2_play/domain/entities/place.dart';
import 'package:place_2_play/data/datasources/local/place_local_datasource_sqflite.dart';

// here we call the corresponding local source
class PlaceRepository {
  late PlaceLocalDataSource localDataSource;

  PlaceRepository() {
    logInfo("Starting EventRepository");
    localDataSource = PlaceLocalDataSource();
  }

  Future<void> addPlace(Place place) async {
    await localDataSource.addPlace(place);
  }

  Future<void> deletePlace(Place place) async {
    await localDataSource.deletePlace(place);
  }

  Future<void> updatePlace(Place place) async {
    await localDataSource.updatePlace(place);
  }
}
