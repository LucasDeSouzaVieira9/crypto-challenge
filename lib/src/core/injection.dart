import 'package:crypto_challenge/src/core/cg_interceptor.dart';
import 'package:crypto_challenge/src/repositories/crypto_repository.dart';
import 'package:crypto_challenge/src/screens/coin_detail_screen/coin_detail_view_model.dart';
import 'package:crypto_challenge/src/screens/coins_screen/coins_view_model.dart';
import 'package:crypto_challenge/src/utils/shared_preferences_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  await _configsInitialize();
  _repositoryInitialize();
  _initializeViewModels();
}

void _repositoryInitialize() {
  getIt.registerFactory<CryptoRepository>(() => CryptoRepository(getIt()));
}

void _initializeViewModels() {
  getIt.registerFactory<CoinsViewModel>(() => CoinsViewModel(getIt(), getIt()));
  getIt.registerFactory<CoinDetailViewModel>(() => CoinDetailViewModel(getIt(), getIt()));
}

Future<void> _configsInitialize() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  getIt.registerFactory<SharedPreferences>(() => preferences);
  getIt.registerFactory<SharedPreferencesService>(() => SharedPreferencesService(getIt()));

  getIt.registerLazySingleton<Dio>(() {
    const baseUrl = 'https://api.coingecko.com/api/v3';

    var options = BaseOptions();
    final dio = Dio(options);
    dio.interceptors.addAll([LogInterceptor(responseBody: true, requestBody: true, requestHeader: true), CGInterceptor(baseUrl)]);

    return dio;
  });
}
