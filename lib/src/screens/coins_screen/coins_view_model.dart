import 'package:crypto_challenge/src/core/business_exception.dart';
import 'package:crypto_challenge/src/core/safe_notifier.dart';
import 'package:crypto_challenge/src/dto/crypto_dto.dart';
import 'package:crypto_challenge/src/enums/coins_filter.dart';
import 'package:crypto_challenge/src/enums/coins_status.dart';
import 'package:crypto_challenge/src/repositories/crypto_repository.dart';
import 'package:crypto_challenge/src/utils/shared_preferences_service.dart';
import 'package:flutter/material.dart';

class CoinsViewModel with ChangeNotifier, SafeNotifierMixin {
  final SharedPreferencesService _prefs;
  final CryptoRepository _repository;
  CoinsStatus status = CoinsStatus.loading;
  final List<CryptoDto> _cryptos = [];
  List<String> _favoriteCryptos = [];
  bool _fetchedLastPage = false;
  bool _isListLocked = false;
  String errorMessage = '';
  int _page = 1;
  String _query = '';
  CoinsFilter _filter = CoinsFilter.all;

  CoinsViewModel(this._prefs, this._repository);

  Future<void> getCryptos({required CoinsFilter filter, String? query, ScrollNotification? scrollNotification, bool isPullToRefresh = false}) async {
    try {
      if (filter != _filter) {
        clearResults();
        _filter = filter;
      }
      if (query != null) {
        clearResults();
        _query = query;
      }

      if (_shouldFetchNextPage(scrollNotification)) {
        _isListLocked = true;
        if (!isPullToRefresh) {
          emitStatus(scrollNotification != null ? CoinsStatus.paginationLoading : CoinsStatus.loading);
        }

        final newCryptos = await _repository.getCoins(
          page: _page,
          perPage: 250,
          query: _query.isEmpty ? null : _query,
          queryIds: filter.isFavorites ? _favoriteCryptos : null,
        );

        _page += 1;
        _fetchedLastPage = newCryptos.isEmpty;
        _isListLocked = false;
        _cryptos.addAll(newCryptos);

        if (cryptos.isNotEmpty) {
          emitStatus(CoinsStatus.success);
        } else if (query?.isNotEmpty ?? false) {
          emitStatus(CoinsStatus.searchEmpty);
        } else {
          emitStatus(CoinsStatus.empty);
        }
      }
    } on BusinessException catch (error) {
      errorMessage = error.message;
      emitStatus(CoinsStatus.error);
    } catch (e) {
      emitStatus(CoinsStatus.error);
      errorMessage = 'Erro ao buscar detalhes da moeda';
    }
  }

  Future<void> favoriteCrypto(String cryptoId) async {
    loadFavorites();
    if (_favoriteCryptos.contains(cryptoId)) {
      _favoriteCryptos.remove(cryptoId);
      if (_filter.isFavorites) _cryptos.removeWhere((element) => element.id == cryptoId);
    } else {
      _favoriteCryptos.add(cryptoId);
    }
    _prefs.saveFavoritesCryptos(_favoriteCryptos);
    notify();
  }

  bool _shouldFetchNextPage(ScrollNotification? scrollInfo) {
    if (scrollInfo == null) return true;
    if (_isListLocked || _fetchedLastPage) return false;
    if (scrollInfo.metrics.axisDirection.index != 2) return false;
    final nextPageFetchingThreshold = scrollInfo.metrics.maxScrollExtent;
    return scrollInfo.metrics.pixels >= nextPageFetchingThreshold;
  }

  void clearResults() {
    _cryptos.clear();
    _fetchedLastPage = false;
    _isListLocked = false;
    _page = 1;
  }

  void loadFavorites() {
    _favoriteCryptos = _prefs.loadFavoritesCryptos();
    notify();
  }

  void emitStatus(CoinsStatus newStatus) {
    status = newStatus;
    notify();
  }

  List<CryptoDto> get cryptos => _cryptos;
  List<String> get favoriteCryptos => _favoriteCryptos;
}
