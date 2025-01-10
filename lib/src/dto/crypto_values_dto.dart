// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:crypto_challenge/src/dto/crypto_variation_dto.dart';
import 'package:flutter/foundation.dart';

class CryptoValuesDto {
  final List<CryptoVariationDto> prices;
  final List<CryptoVariationDto> marketCaps;
  final List<CryptoVariationDto> totalVolumes;
  CryptoValuesDto({
    required this.prices,
    required this.marketCaps,
    required this.totalVolumes,
  });

  CryptoValuesDto copyWith({
    List<CryptoVariationDto>? prices,
    List<CryptoVariationDto>? marketCaps,
    List<CryptoVariationDto>? totalVolumes,
  }) {
    return CryptoValuesDto(
      prices: prices ?? this.prices,
      marketCaps: marketCaps ?? this.marketCaps,
      totalVolumes: totalVolumes ?? this.totalVolumes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'prices': prices.map((x) => x.toMap()).toList(),
      'marketCaps': marketCaps.map((x) => x.toMap()).toList(),
      'totalVolumes': totalVolumes.map((x) => x.toMap()).toList(),
    };
  }

  factory CryptoValuesDto.fromMap(Map<String, dynamic> map) {
    return CryptoValuesDto(
      prices: List<CryptoVariationDto>.from(
        (map['prices'] as List<dynamic>).map<CryptoVariationDto>(
          (x) => CryptoVariationDto.fromMap(x as List<dynamic>),
        ),
      ),
      marketCaps: List<CryptoVariationDto>.from(
        (map['market_caps'] as List<dynamic>).map<CryptoVariationDto>(
          (x) => CryptoVariationDto.fromMap(x as List<dynamic>),
        ),
      ),
      totalVolumes: List<CryptoVariationDto>.from(
        (map['total_volumes'] as List<dynamic>).map<CryptoVariationDto>(
          (x) => CryptoVariationDto.fromMap(x as List<dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoValuesDto.fromJson(String source) => CryptoValuesDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CryptoValuesDto(prices: $prices, marketCaps: $marketCaps, totalVolumes: $totalVolumes)';

  @override
  bool operator ==(covariant CryptoValuesDto other) {
    if (identical(this, other)) return true;

    return listEquals(other.prices, prices) && listEquals(other.marketCaps, marketCaps) && listEquals(other.totalVolumes, totalVolumes);
  }

  @override
  int get hashCode => prices.hashCode ^ marketCaps.hashCode ^ totalVolumes.hashCode;
}
