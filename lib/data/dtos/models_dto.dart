import 'package:clean_fipe/domain/entities/model_entity.dart';

class ModelsDto extends ModelEntity {
  ModelsDto({
    required String name,
    required String code,
  }) : super(
          code: code,
          name: name,
        );

  factory ModelsDto.fromMap(Map<String, dynamic> map) {
    return ModelsDto(
      name: map['name'] ?? '',
      code: map['code'] ?? '',
    );
  }

  @override
  String toString() => 'Model(name: $name, code: $code)';
}
