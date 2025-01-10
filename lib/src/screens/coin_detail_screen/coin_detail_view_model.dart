import 'package:crypto_challenge/src/core/business_exception.dart';
import 'package:crypto_challenge/src/core/safe_notifier.dart';
import 'package:crypto_challenge/src/dto/crypto_details_dto.dart';
import 'package:crypto_challenge/src/dto/crypto_values_dto.dart';
import 'package:crypto_challenge/src/enums/coin_detail_status.dart';
import 'package:crypto_challenge/src/repositories/crypto_repository.dart';
import 'package:crypto_challenge/src/utils/shared_preferences_service.dart';
import 'package:flutter/material.dart';

class CoinDetailViewModel with ChangeNotifier, SafeNotifierMixin {
  final SharedPreferencesService _prefs;
  final CryptoRepository _repository;
  CoinDetailStatus status = CoinDetailStatus.loading;
  String errorMessage = '';
  List<String> _favoriteCryptos = [];
  CryptoDetailsDto? _cryptoDetail;
  CryptoValuesDto? _cryptoHistory;

  CoinDetailViewModel(this._prefs, this._repository);

  Future<void> getDetails({required String id}) async {
    try {
      emitStatus(CoinDetailStatus.loading);

      _cryptoDetail = await _repository.getCoinDetails(id);
      _cryptoHistory = await _repository.getCoinHistory(id);

      emitStatus(CoinDetailStatus.success);
    } on BusinessException catch (error) {
      errorMessage = error.message;
      emitStatus(CoinDetailStatus.error);
    } catch (e) {
      emitStatus(CoinDetailStatus.error);
      errorMessage = 'Erro ao buscar detalhes da moeda';
    }
  }

  Future<void> favoriteCrypto(String cryptoId) async {
    loadFavorites();
    if (_favoriteCryptos.contains(cryptoId)) {
      _favoriteCryptos.remove(cryptoId);
    } else {
      _favoriteCryptos.add(cryptoId);
    }
    _prefs.saveFavoritesCryptos(_favoriteCryptos);
    notify();
  }

  void loadFavorites() {
    _favoriteCryptos = _prefs.loadFavoritesCryptos();
    notify();
  }

  void emitStatus(CoinDetailStatus newStatus) {
    status = newStatus;
    notify();
  }

  CryptoDetailsDto get cryptoDetail => _cryptoDetail!;
  CryptoValuesDto get cryptoHistory => _cryptoHistory!;
  List<String> get favoriteCryptos => _favoriteCryptos;
}
