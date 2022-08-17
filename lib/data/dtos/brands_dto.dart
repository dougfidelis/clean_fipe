import '../../domain/entities/brand_entity.dart';

class BrandsDto extends BrandEntity {
  BrandsDto({
    required String brandName,
    required String codeBrand,
  }) : super(
          brandName: brandName,
          codeBrand: codeBrand,
        );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': brandName});
    result.addAll({'code': codeBrand});

    return result;
  }

  factory BrandsDto.fromMap(Map<String, dynamic> map) {
    return BrandsDto(
      brandName: map['name'] ?? '',
      codeBrand: map['code'] ?? '',
    );
  }
}
