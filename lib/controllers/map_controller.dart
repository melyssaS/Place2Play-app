import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loggy/loggy.dart';

import '../domain/use_case/map.dart';

class MapsController extends GetxController {
  final Map<MarkerId, Marker> _markers = {};
  final RxList _predictions = [].obs;
  late LatLng _predictedPos;

  MapUseCase mapUseCase = Get.find();

  MapsController() {
    const marker = Marker(
        markerId: MarkerId('1'), position: LatLng(11.010245, -74.815318));
    _markers[const MarkerId('1')] = marker;
  }

  Set<Marker> get getMarkers => _markers.values.toSet();
  List get getPredictions => _predictions;
  LatLng get getPlacePredict => _predictedPos;
  
  addMarker(Marker marker) {
    _markers.removeWhere(
      (key, value) => key == key,
    );
    logInfo("before $_markers");
    final addedMarker =
        Marker(markerId: marker.markerId, position: marker.position);
    _markers[marker.markerId] = addedMarker;
    logInfo("after $_markers");
  }

  Future<void> findPlacePrediction(String value) async {
    if (value.isNotEmpty) {
      Position position = await _determinePosition();
      var result = await mapUseCase.findpredictions(value, position);
      _predictions.clear();
      for (var prediction in result!) {
        _predictions.add(prediction);
      }
    } else {
      _predictions.clear();
    }
  }

  Future<void> findPlacePredictions(String placeid) async {
    var result = await mapUseCase.findPlaceSelected(placeid);
    var placesExists = _predictions.contains(result);
    if (placesExists == false) {
      _predictions.add(result);
    }
    _predictedPos = result;
  }

  predictionClear() {
    _predictions.clear();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permission are permanently denied');
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
