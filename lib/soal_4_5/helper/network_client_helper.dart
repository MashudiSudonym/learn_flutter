import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkClientHelper {
  static final Dio _client = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      contentType: Headers.jsonContentType,
      headers: {
        'Accept': 'application/json',
      },
    ),
  )..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 80,
      ),
    );

  NetworkClientHelper._();

  static final instance = NetworkClientHelper._();

  Dio get client => _client;
}
