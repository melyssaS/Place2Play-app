import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:place_2_play/domain/repositories/map_repository.dart';

class MapUseCase {
  MapRepository repository = Get.find();

  Future<List<AutocompletePrediction>?> findpredictions(input , position) async => await repository.getPredictions(input , position);

  Future<LatLng> findPlaceSelected(placeid) async => await repository.findPlaceSelected(placeid);
}
