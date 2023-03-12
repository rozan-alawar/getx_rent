import '../category_details/unit_model.dart';

class Category {
  final String name;
  int unitNumber;
  final List<Unit> units;

  Category({
    required this.name,
    required this.unitNumber,
    required this.units,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    final unitList = (json['units'] as List<dynamic>)
        .map((unitJson) => Unit.fromJson(unitJson))
        .toList();

    return Category(
      name: json['name'],
      unitNumber: json['unitNumber'],
      units: unitList,
    );
  }

  Map<String, dynamic> toJson() {
    final unitList = units.map((unit) => unit.toJson()).toList();

    return {
      'name': name,
      'unitNumber': unitNumber,
      'units': unitList,
    };
  }
}
