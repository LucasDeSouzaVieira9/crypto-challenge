import 'dart:convert';

class CryptoDto {
  final String id;
  final String symbol;
  final String name;
  final String? image;
  final num? currentPrice;
  final num? marketCap;
  final num? marketCapRank;
  final num? fullyDilutedValuation;
  final num? totalVolume;
  final num? high24h;
  final num? low24h;
  final num? priceChange24h;
  final num? priceChangePercentage24h;
  final num? marketCapChange24h;
  final num? marketCapChangePercentage24h;
  final num? circulatingSupply;
  final num? totalSupply;
  final num? maxSupply;
  final DateTime lastUpdated;
  CryptoDto({
    required this.id,
    required this.symbol,
    required this.name,
    this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.fullyDilutedValuation,
    required this.totalVolume,
    required this.high24h,
    required this.low24h,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
    required this.marketCapChange24h,
    required this.marketCapChangePercentage24h,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.maxSupply,
    required this.lastUpdated,
  });

  CryptoDto copyWith({
    String? id,
    String? symbol,
    String? name,
    String? image,
    num? currentPrice,
    num? marketCap,
    num? marketCapRank,
    num? fullyDilutedValuation,
    num? totalVolume,
    num? high24h,
    num? low24h,
    num? priceChange24h,
    num? priceChangePercentage24h,
    num? marketCapChange24h,
    num? marketCapChangePercentage24h,
    num? circulatingSupply,
    num? totalSupply,
    num? maxSupply,
    DateTime? lastUpdated,
  }) {
    return CryptoDto(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      image: image ?? this.image,
      currentPrice: currentPrice ?? this.currentPrice,
      marketCap: marketCap ?? this.marketCap,
      marketCapRank: marketCapRank ?? this.marketCapRank,
      fullyDilutedValuation: fullyDilutedValuation ?? this.fullyDilutedValuation,
      totalVolume: totalVolume ?? this.totalVolume,
      high24h: high24h ?? this.high24h,
      low24h: low24h ?? this.low24h,
      priceChange24h: priceChange24h ?? this.priceChange24h,
      priceChangePercentage24h: priceChangePercentage24h ?? this.priceChangePercentage24h,
      marketCapChange24h: marketCapChange24h ?? this.marketCapChange24h,
      marketCapChangePercentage24h: marketCapChangePercentage24h ?? this.marketCapChangePercentage24h,
      circulatingSupply: circulatingSupply ?? this.circulatingSupply,
      totalSupply: totalSupply ?? this.totalSupply,
      maxSupply: maxSupply ?? this.maxSupply,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'symbol': symbol,
      'name': name,
      'image': image,
      'current_price': currentPrice,
      'market_cap': marketCap,
      'market_cap_rank': marketCapRank,
      'fully_diluted_valuation': fullyDilutedValuation,
      'total_volume': totalVolume,
      'high_24h': high24h,
      'low_24h': low24h,
      'price_change_24h': priceChange24h,
      'price_change_percentage_24h': priceChangePercentage24h,
      'market_cap_change_24h': marketCapChange24h,
      'market_cap_change_percentage_24h': marketCapChangePercentage24h,
      'circulating_supply': circulatingSupply,
      'total_supply': totalSupply,
      'max_supply': maxSupply,
      'last_updated': lastUpdated.millisecondsSinceEpoch,
    };
  }

  factory CryptoDto.fromMap(Map<String, dynamic> map) {
    return CryptoDto(
      id: map['id'] as String,
      symbol: map['symbol'] as String,
      name: map['name'] as String,
      image: map['image'] != null ? map['image'] as String : null,
      currentPrice: map['current_price'] != null ? map['current_price'] as num : null,
      marketCap: map['market_cap'] != null ? map['market_cap'] as num : null,
      marketCapRank: map['market_cap_rank'] != null ? map['market_cap_rank'] as num : null,
      fullyDilutedValuation: map['fully_diluted_valuation'] != null ? map['fully_diluted_valuation'] as num : null,
      totalVolume: map['total_volume'] != null ? map['total_volume'] as num : null,
      high24h: map['high_24h'] != null ? map['high_24h'] as num : null,
      low24h: map['low_24h'] != null ? map['low_24h'] as num : null,
      priceChange24h: map['price_change_24h'] != null ? map['price_change_24h'] as num : null,
      priceChangePercentage24h: map['price_change_percentage_24h'] != null ? map['price_change_percentage_24h'] as num : null,
      marketCapChange24h: map['market_cap_change_24h'] != null ? map['market_cap_change_24h'] as num : null,
      marketCapChangePercentage24h: map['market_cap_change_percentage_24h'] != null ? map['market_cap_change_percentage_24h'] as num : null,
      circulatingSupply: map['circulating_supply'] != null ? map['circulating_supply'] as num : null,
      totalSupply: map['total_supply'] != null ? map['total_supply'] as num : null,
      maxSupply: map['max_supply'] != null ? map['max_supply'] as num : null,
      lastUpdated: DateTime.parse(map['last_updated'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoDto.fromJson(String source) => CryptoDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CryptoDto(id: $id, symbol: $symbol, name: $name, image: $image, currentPrice: $currentPrice, marketCap: $marketCap, marketCapRank: $marketCapRank, fullyDilutedValuation: $fullyDilutedValuation, totalVolume: $totalVolume, high24h: $high24h, low24h: $low24h, priceChange24h: $priceChange24h, priceChangePercentage24h: $priceChangePercentage24h, marketCapChange24h: $marketCapChange24h, marketCapChangePercentage24h: $marketCapChangePercentage24h, circulatingSupply: $circulatingSupply, totalSupply: $totalSupply, maxSupply: $maxSupply, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(covariant CryptoDto other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.symbol == symbol &&
        other.name == name &&
        other.image == image &&
        other.currentPrice == currentPrice &&
        other.marketCap == marketCap &&
        other.marketCapRank == marketCapRank &&
        other.fullyDilutedValuation == fullyDilutedValuation &&
        other.totalVolume == totalVolume &&
        other.high24h == high24h &&
        other.low24h == low24h &&
        other.priceChange24h == priceChange24h &&
        other.priceChangePercentage24h == priceChangePercentage24h &&
        other.marketCapChange24h == marketCapChange24h &&
        other.marketCapChangePercentage24h == marketCapChangePercentage24h &&
        other.circulatingSupply == circulatingSupply &&
        other.totalSupply == totalSupply &&
        other.maxSupply == maxSupply &&
        other.lastUpdated == lastUpdated;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        symbol.hashCode ^
        name.hashCode ^
        image.hashCode ^
        currentPrice.hashCode ^
        marketCap.hashCode ^
        marketCapRank.hashCode ^
        fullyDilutedValuation.hashCode ^
        totalVolume.hashCode ^
        high24h.hashCode ^
        low24h.hashCode ^
        priceChange24h.hashCode ^
        priceChangePercentage24h.hashCode ^
        marketCapChange24h.hashCode ^
        marketCapChangePercentage24h.hashCode ^
        circulatingSupply.hashCode ^
        totalSupply.hashCode ^
        maxSupply.hashCode ^
        lastUpdated.hashCode;
  }
}
