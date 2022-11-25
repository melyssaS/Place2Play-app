import 'package:google_maps_flutter/google_maps_flutter.dart';

class Event {
  final String title;
  final String description;
  final DateTime start;
  final DateTime end;
  final String? id;
  final double price;
  final UserCategory category;
  final LatLng address;
  final String deporte;

  const Event(
      {required this.title,
      required this.description,
      required this.start,
      required this.end,
      required this.price,
      this.id,
      required this.category,
      required this.address,
      required this.deporte});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'start': start.toString(),
      'end': end.toString(),
      'price': price.toString(),
      'category': category.toString(),
      'latitude': address.latitude,
      'longitude': address.longitude,
      'deporte' : deporte
    };
  }
}

enum UserCategory { history, created, starred }
