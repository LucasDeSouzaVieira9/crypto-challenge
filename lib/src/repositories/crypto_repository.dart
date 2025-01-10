import 'package:crypto_challenge/src/core/business_exception.dart';
import 'package:crypto_challenge/src/dto/crypto_details_dto.dart';
import 'package:crypto_challenge/src/dto/crypto_dto.dart';
import 'package:crypto_challenge/src/dto/crypto_values_dto.dart';
import 'package:dio/dio.dart';

class CryptoRepository {
  final Dio _dio;

  CryptoRepository(this._dio);

  Future<List<CryptoDto>> getCoins({
    String? query,
    int page = 1,
    int perPage = 15,
    String vsCurrency = 'usd',
    List<String>? queryIds,
  }) async {
    try {
      List<String> newQueryIds = queryIds ?? [];

      if (query?.isNotEmpty ?? false) {
        final response = await _dio.get('/search?query=$query');
        newQueryIds = response.data['coins'].map((coin) => coin['id'].toString()).toList().cast<String>();
        if (queryIds != null) newQueryIds = newQueryIds.where((element) => queryIds.contains(element)).toList();
        if (newQueryIds.isEmpty) return [];
      }

      final response = await _dio.get(
        '/coins/markets',
        queryParameters: {
          'vs_currency': vsCurrency,
          'order': 'market_cap_desc',
          'per_page': perPage,
          'page': page,
          'sparkline': false,
          if (newQueryIds.isNotEmpty) 'ids': newQueryIds.join(','),
        },
      );

      return (response.data as List).map((e) => CryptoDto.fromMap(e)).toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        throw BusinessException(
          'Você atingiu o limite de requisições, esta API gratuita possui limite de 30 requisições por minuto. Aguarde alguns segundos e tente novamente.',
        );
      } else {
        rethrow;
      }
    }
  }

  Future<CryptoDetailsDto> getCoinDetails(String id) async {
    try {
      final response = await _dio.get(
        '/coins/$id',
        queryParameters: {
          'localization': false,
          'tickers': false,
          'market_data': true,
          'community_data': false,
          'developer_data': false,
          'sparkline': false,
        },
      );

      return CryptoDetailsDto.fromMap(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        throw BusinessException(
          'Você atingiu o limite de requisições, esta API gratuita possui limite de 30 requisições por minuto. Aguarde alguns segundos e tente novamente.',
        );
      } else {
        rethrow;
      }
    }
  }

  Future<CryptoValuesDto> getCoinHistory(String id) async {
    try {
      final response = await _dio.get(
        '/coins/$id/market_chart',
        queryParameters: {'days': 1, 'vs_currency': "usd"},
      );

      return CryptoValuesDto.fromMap(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        throw BusinessException(
          'Você atingiu o limite de requisições, esta API gratuita possui limite de 30 requisições por minuto. Aguarde alguns segundos e tente novamente.',
        );
      } else {
        rethrow;
      }
    }
  }
}
