import 'dart:convert';

class CryptoVariationDto {
  final DateTime dateTime;
  final double value;

  CryptoVariationDto({
    required this.dateTime,
    required this.value,
  });

  CryptoVariationDto copyWith({
    DateTime? dateTime,
    double? value,
  }) {
    return CryptoVariationDto(
      dateTime: dateTime ?? this.dateTime,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dateTime': dateTime.millisecondsSinceEpoch,
      'value': value,
    };
  }

  factory CryptoVariationDto.fromMap(List<dynamic> list) {
    return CryptoVariationDto(
      dateTime: DateTime.fromMillisecondsSinceEpoch(list[0] as int),
      value: (list[1] as num).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'CryptoVariationDto(dateTime: $dateTime, value: $value)';

  @override
  bool operator ==(covariant CryptoVariationDto other) {
    if (identical(this, other)) return true;

    return other.dateTime == dateTime && other.value == value;
  }

  @override
  int get hashCode => dateTime.hashCode ^ value.hashCode;
}
