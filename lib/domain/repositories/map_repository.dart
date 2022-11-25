import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:place_2_play/data/datasources/remote/map_remote_datasource.dart';

class MapRepository {
  late MapRemoteDatasource remoteDataSource;

  MapRepository() {
    remoteDataSource = MapRemoteDatasource();
  }

Future<List<AutocompletePrediction>?>getPredictions(input,position) async => await remoteDataSource.findPredictions(input,position);

Future<LatLng>findPlaceSelected(placeid) async => await remoteDataSource.findPlaceSelected(placeid);


}
