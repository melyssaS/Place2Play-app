import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';

class MapRemoteDatasource {
  var googlePlace = GooglePlace('AIzaSyBlbbPKXfQzDv3pciiLCKP-xETfnei4lOM');

  Future<List<AutocompletePrediction>?> findPredictions(
      String input, Position position) async {
    var result = await googlePlace.autocomplete.get(input,
        location: LatLon(position.latitude, position.longitude), radius: 1000);
    if (result != null && result.predictions != null) {
      return result.predictions;
    }
    return Future.error("error finding the data");
  }

  Future<LatLng> findPlaceSelected(String placeid) async {
    var result = await googlePlace.details.get(placeid, fields: "geometry,name");
    if (result != null && result.result != null) {
      var data = result.result;
      double? lat = data?.geometry?.location!.lat;
      double? lng = data?.geometry?.location!.lng;
      LatLng newLocalization = LatLng(lat!, lng!);

      return newLocalization;
    }
    return Future.error("error finding the data");
  }
}
