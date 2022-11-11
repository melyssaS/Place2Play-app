import 'package:get/get.dart';
import 'package:place_2_play/domain/repositories/event_repository.dart';
import 'package:place_2_play/domain/entities/event.dart';

//use case
class EventUseCase {
  EventRepository repository = Get.find();

  Future<void> addEvent(event) async => await repository.addEvent(event);

  Future<void> deletePlace(event) async => await repository.deleteEvent(event);

  Future<void> updatePlace(event) async => await repository.updateEvent(event);

  Future<List<Event>> getAllEvents() async => await repository.getAllEvents();
}
