import 'dart:convert';


class AddressEntity {
    final int? id;
  final String address;
  final double lat;
  final double lng;
  final String additional;
  AddressEntity({
    this.id,
    required this.address,
    required this.lat,
    required this.lng,
    required this.additional,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address': address,
      'lat': lat,
      'lng': lng,
      'additional': additional,
    };
  }

  factory AddressEntity.fromMap(Map<String, dynamic> map) {
    return AddressEntity(
      id: map['id']?.toInt(),
      address: map['address'] ?? '',
      lat: map['lat']?.toDouble() ?? 0.0,
      lng: map['lng']?.toDouble() ?? 0.0,
      additional: map['additional'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressEntity.fromJson(String source) => AddressEntity.fromMap(json.decode(source));
}
