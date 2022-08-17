import 'dart:convert';

class ReferenceMonthEntity {
  String code;
  String month;

  ReferenceMonthEntity({
    required this.code,
    required this.month,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'code': code});
    result.addAll({'month': month});

    return result;
  }

  factory ReferenceMonthEntity.fromMap(Map<String, dynamic> map) {
    return ReferenceMonthEntity(
      code: map['code'] ?? '',
      month: map['month'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ReferenceMonthEntity.fromJson(String source) =>
      ReferenceMonthEntity.fromMap(json.decode(source));
}
