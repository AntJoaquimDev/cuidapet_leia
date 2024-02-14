import 'dart:convert';

class SupplierNearbyMeModel {
  final int id;
  final String name;
  final String logo;
  final double disance;
  final int category;

  SupplierNearbyMeModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.disance,
    required this.category,
  });

  


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'disance': disance,
      'category': category,
    };
  }

  factory SupplierNearbyMeModel.fromMap(Map<String, dynamic> map) {
    return SupplierNearbyMeModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      logo: map['logo'] ?? '',
      disance: map['disance']?.toDouble() ?? 0.0,
      category: map['category']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SupplierNearbyMeModel.fromJson(String source) => SupplierNearbyMeModel.fromMap(json.decode(source));
}
