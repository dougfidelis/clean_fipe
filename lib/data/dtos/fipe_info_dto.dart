import 'package:clean_fipe/domain/entities/fipe_info_entity.dart';

class FipeInfoDto extends FipeInfoEntity {
  FipeInfoDto(
      {required String price,
      required String brand,
      required String model,
      required int modelYear,
      required String fuel,
      required String codeFipe,
      required String referenceMonth,
      required int vehicleType,
      required String fuelAcronym})
      : super(
            price: price,
            brand: brand,
            model: model,
            modelYear: modelYear,
            fuel: fuel,
            codeFipe: codeFipe,
            referenceMonth: referenceMonth,
            vehicleType: vehicleType,
            fuelAcronym: fuelAcronym);

  factory FipeInfoDto.fromMap(Map<String, dynamic> map) {
    return FipeInfoDto(
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
