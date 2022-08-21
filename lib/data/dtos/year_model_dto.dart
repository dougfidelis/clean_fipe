import 'package:clean_fipe/domain/entities/year_model_entity.dart';

class YearModelDto extends YearModelEntity {
  YearModelDto({
    required String name,
    required String code,
  }) : super(
          code: code,
          name: name,
        );

  factory YearModelDto.fromMap(Map<String, dynamic> map) {
    return YearModelDto(
      name: map['name'] ?? '',
      code: map['code'] ?? '',
    );
  }

  @override
  String toString() => 'YearModel(name: $name, code: $code)';
}
