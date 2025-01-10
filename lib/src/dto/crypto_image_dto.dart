import 'dart:convert';

class CryptoImageDto {
  final String? thumb;
  final String? small;
  final String? large;
  CryptoImageDto({
    this.thumb,
    this.small,
    this.large,
  });

  CryptoImageDto copyWith({
    String? thumb,
    String? small,
    String? large,
  }) {
    return CryptoImageDto(
      thumb: thumb ?? this.thumb,
      small: small ?? this.small,
      large: large ?? this.large,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'thumb': thumb,
      'small': small,
      'large': large,
    };
  }

  factory CryptoImageDto.fromMap(Map<String, dynamic> map) {
    return CryptoImageDto(
      thumb: map['thumb'] != null ? map['thumb'] as String : null,
      small: map['small'] != null ? map['small'] as String : null,
      large: map['large'] != null ? map['large'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoImageDto.fromJson(String source) => CryptoImageDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CryptoImageDto(thumb: $thumb, small: $small, large: $large)';

  @override
  bool operator ==(covariant CryptoImageDto other) {
    if (identical(this, other)) return true;

    return other.thumb == thumb && other.small == small && other.large == large;
  }

  @override
  int get hashCode => thumb.hashCode ^ small.hashCode ^ large.hashCode;
}
