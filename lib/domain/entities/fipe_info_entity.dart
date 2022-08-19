class FipeInfoEntity {
  final String price;
  final String brand;
  final String model;
  final int modelYear;
  final String fuel;
  final String codeFipe;
  final String referenceMonth;
  final int vehicleType;
  final String fuelAcronym;
  FipeInfoEntity({
    required this.price,
    required this.brand,
    required this.model,
    required this.modelYear,
    required this.fuel,
    required this.codeFipe,
    required this.referenceMonth,
    required this.vehicleType,
    required this.fuelAcronym,
  });

  factory FipeInfoEntity.fromMap(Map<String, dynamic> map) {
    return FipeInfoEntity(
      price: map['price'] ?? '',
      brand: map['brand'] ?? '',
      model: map['model'] ?? '',
      modelYear: map['modelYear']?.toInt() ?? 0,
      fuel: map['fuel'] ?? '',
      codeFipe: map['codeFipe'] ?? '',
      referenceMonth: map['referenceMonth'] ?? '',
      vehicleType: map['vehicleType']?.toInt() ?? 0,
      fuelAcronym: map['fuelAcronym'] ?? '',
    );
  }

  @override
  String toString() {
    return 'FipeInfo(price: $price, brand: $brand, model: $model, modelYear: $modelYear, fuel: $fuel, codeFipe: $codeFipe, referenceMonth: $referenceMonth, vehicleType: $vehicleType, fuelAcronym: $fuelAcronym)';
  }
}
