import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService(this._prefs);
  final SharedPreferences _prefs;

  final String _favoriteCryptosKey = 'favorite_cryptos';

  Future<void> saveFavoritesCryptos(List<String> favoriteCryptos) async {
    await _prefs.setStringList(_favoriteCryptosKey, favoriteCryptos);
  }

  Future<void> saveFavoriteCrypto(String cryptoId) async {
    final favoriteCryptos = loadFavoritesCryptos();
    favoriteCryptos.add(cryptoId);
    await saveFavoritesCryptos(favoriteCryptos);
  }

  List<String> loadFavoritesCryptos() => _prefs.getStringList(_favoriteCryptosKey) ?? [];
}
