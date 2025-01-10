import 'package:dio/dio.dart';

class CGInterceptor extends Interceptor {
  CGInterceptor(this.url);

  final String url;

  String get baseUrl => url;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.baseUrl = baseUrl;
    // options.headers.addAll(headers);
    handler.next(options);
  }
}
