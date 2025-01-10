import 'dart:convert';

import 'package:crypto_challenge/src/dto/crypto_image_dto.dart';
import 'package:crypto_challenge/src/dto/crypto_market_data_dto.dart';

class CryptoDetailsDto {
  final String id;
  final String symbol;
  final CryptoImageDto? image;
  final String? description;
  final CryptoMarketDataDto marketData;
  CryptoDetailsDto({
    required this.id,
    required this.symbol,
    this.image,
    this.description,
    required this.marketData,
  });

  CryptoDetailsDto copyWith({
    String? id,
    String? symbol,
    String? description,
    CryptoImageDto? image,
    CryptoMarketDataDto? marketData,
  }) {
    return CryptoDetailsDto(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      image: image ?? this.image,
      marketData: marketData ?? this.marketData,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'symbol': symbol,
      'description': description,
      'image': image?.toMap(),
      'market_data': marketData.toMap(),
    };
  }

  factory CryptoDetailsDto.fromMap(Map<String, dynamic> map) {
    return CryptoDetailsDto(
      id: map['id'] as String,
      symbol: map['symbol'] as String,
      description: map['description']['en'] != null ? map['description']['en'] as String : null,
      image: map['image'] != null ? CryptoImageDto.fromMap(map['image'] as Map<String, dynamic>) : null,
      marketData: CryptoMarketDataDto.fromMap(map['market_data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoDetailsDto.fromJson(String source) => CryptoDetailsDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CryptoDetailsDto(id: $id, symbol: $symbol, image: $image, marketData: $marketData)';
  }

  @override
  bool operator ==(covariant CryptoDetailsDto other) {
    if (identical(this, other)) return true;

    return other.id == id && other.symbol == symbol && other.image == image && other.marketData == marketData;
  }

  @override
  int get hashCode {
    return id.hashCode ^ symbol.hashCode ^ image.hashCode ^ marketData.hashCode;
  }
}
