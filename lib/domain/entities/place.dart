class Place {
  final String? id;
  // final LatLng latLng;
  final String name;
  final String address;
  final String? img;

  // constructor for the object place
  const Place({
    this.id,
    //  required this.latLng,
    required this.name,
    required this.address,
    this.img,
  });

  //double get latitude => latLng.latitude;

  // double get longitude => latLng.longitude;

  //String get getId => id;

  String get getName => name;

  Place copyWith(
      {String? id,
      //LatLng? latLng,
      String? name,
      String? address,
      String? img}) {
    return Place(
      id: id ?? this.id,
      //latLng: latLng ?? this.latLng,
      name: name ?? this.name,
      address: address ?? this.address,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      //  'latitude': latLng.latitude,
      // 'longitude': latLng.longitude,
      'name': name,
      'address': address,
      'img': img,
    };
  }
}
