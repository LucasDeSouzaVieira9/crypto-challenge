import 'dart:convert';

class CryptoMarketDataDto {
  final num currentPrice;
  final num marketCap;
  final num ath;
  final num atl;
  final num circulatingSupply;
  final num? maxSupply;
  final num totalSupply;
  final num marketCapRank;
  final num priceChangePercent24h;
  final DateTime? lastUpdated;
  CryptoMarketDataDto({
    required this.currentPrice,
    required this.marketCap,
    required this.ath,
    required this.atl,
    required this.circulatingSupply,
    required this.maxSupply,
    required this.totalSupply,
    required this.marketCapRank,
    required this.priceChangePercent24h,
    this.lastUpdated,
  });

  CryptoMarketDataDto copyWith({
    num? currentPrice,
    num? marketCap,
    num? ath,
    num? atl,
    num? circulatingSupply,
    num? maxSupply,
    num? totalSupply,
    num? marketCapRank,
    num? priceChangePercent24h,
    DateTime? lastUpdated,
  }) {
    return CryptoMarketDataDto(
      currentPrice: currentPrice ?? this.currentPrice,
      marketCap: marketCap ?? this.marketCap,
      ath: ath ?? this.ath,
      atl: atl ?? this.atl,
      circulatingSupply: circulatingSupply ?? this.circulatingSupply,
      maxSupply: maxSupply ?? this.maxSupply,
      totalSupply: totalSupply ?? this.totalSupply,
      marketCapRank: marketCapRank ?? this.marketCapRank,
      priceChangePercent24h: priceChangePercent24h ?? this.priceChangePercent24h,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentPrice': currentPrice,
      'marketCap': marketCap,
      'ath': ath,
      'atl': atl,
      'circulatingSupply': circulatingSupply,
      'maxSupply': maxSupply,
      'totalSupply': totalSupply,
      'marketCapRank': marketCapRank,
      'priceChangePercent24h': priceChangePercent24h,
      'last_updated': lastUpdated?.millisecondsSinceEpoch,
    };
  }

  factory CryptoMarketDataDto.fromMap(Map<String, dynamic> map) {
    return CryptoMarketDataDto(
      currentPrice: map['current_price']['usd'] as num,
      marketCap: map['market_cap']['usd'] as num,
      ath: map['ath']['usd'] as num,
      atl: map['atl']['usd'] as num,
      circulatingSupply: map['circulating_supply'] as num,
      maxSupply: map['max_supply'] != null ? map['max_supply'] as num : null,
      totalSupply: map['total_supply'] as num,
      marketCapRank: map['market_cap_rank'] as num,
      priceChangePercent24h: map['price_change_percentage_24h'] as num,
      lastUpdated: map['last_updated'] != null ? DateTime.parse(map['last_updated'] as String) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoMarketDataDto.fromJson(String source) => CryptoMarketDataDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CryptoMarketDataDto(currentPrice: $currentPrice, marketCap: $marketCap, ath: $ath, atl: $atl, circulatingSupply: $circulatingSupply, maxSupply: $maxSupply, totalSupply: $totalSupply, marketCapRank: $marketCapRank, priceChangePercent24h: $priceChangePercent24h, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(covariant CryptoMarketDataDto other) {
    if (identical(this, other)) return true;

    return other.currentPrice == currentPrice &&
        other.marketCap == marketCap &&
        other.ath == ath &&
        other.atl == atl &&
        other.circulatingSupply == circulatingSupply &&
        other.maxSupply == maxSupply &&
        other.totalSupply == totalSupply &&
        other.marketCapRank == marketCapRank &&
        other.priceChangePercent24h == priceChangePercent24h &&
        other.lastUpdated == lastUpdated;
  }

  @override
  int get hashCode {
    return currentPrice.hashCode ^
        marketCap.hashCode ^
        ath.hashCode ^
        atl.hashCode ^
        circulatingSupply.hashCode ^
        maxSupply.hashCode ^
        totalSupply.hashCode ^
        marketCapRank.hashCode ^
        priceChangePercent24h.hashCode ^
        lastUpdated.hashCode;
  }
}
