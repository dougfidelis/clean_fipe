class ModelEntity {
  final String name;
  final String code;
  ModelEntity({
    required this.name,
    required this.code,
  });

  factory ModelEntity.fromMap(Map<String, dynamic> map) {
    return ModelEntity(
      name: map['name'] ?? '',
      code: map['code'] ?? '',
    );
  }

  @override
  String toString() => 'Model(name: $name, code: $code)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModelEntity && other.name == name && other.code == code;
  }

  @override
  int get hashCode => name.hashCode ^ code.hashCode;
}
