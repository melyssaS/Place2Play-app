//import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
//import 'package:google_place/google_place.dart';
import 'package:place_2_play/domain/repositories/place_repository.dart';

//use case
class PlacesUseCase {
  PlaceRepository repository = Get.find();

  Future<void> addPlace(place) async => await repository.addPlace(place);

  Future<void> deletePlace(place) async => await repository.deletePlace(place);

  Future<void> updatePlace(place) async => await repository.updatePlace(place);
}
