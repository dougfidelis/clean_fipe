class YearModelEntity {
  final String name;
  final String code;
  YearModelEntity({
    required this.name,
    required this.code,
  });

  factory YearModelEntity.fromMap(Map<String, dynamic> map) {
    return YearModelEntity(
      name: map['name'] ?? '',
      code: map['code'] ?? '',
    );
  }

  @override
  String toString() => 'YearModel(name: $name, code: $code)';
}
