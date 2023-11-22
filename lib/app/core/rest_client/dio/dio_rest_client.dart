import 'package:cuidapet_leia/app/core/helpers/constants.dart';
import 'package:cuidapet_leia/app/core/helpers/environments.dart';
import 'package:cuidapet_leia/app/core/local_stoge/local_storage.dart';
import 'package:cuidapet_leia/app/core/logger/app_logger.dart';
import 'package:cuidapet_leia/app/core/rest_client/dio/inteceptors/auth_interceptor.dart';
import 'package:cuidapet_leia/app/core/rest_client/dio/rest_client_exception.dart';
import 'package:cuidapet_leia/app/modules/core/auth/auth_store.dart';
import 'package:dio/dio.dart';

import 'package:cuidapet_leia/app/core/rest_client/rest_client.dart';
import 'package:cuidapet_leia/app/core/rest_client/rest_client_response.dart';

class DioRestClient implements RestClient {
  late final Dio _dio;

  final _defaultOptions = BaseOptions(
    baseUrl: Environments.param(Constants.ENV_BASE_URL_KEY) ?? '',
    connectTimeout: Duration(
      seconds: int.parse(
          Environments.param(Constants.ENV_REST_CLIENTE_CONNECT_TIMEOUT_KEY) ??
              '0'),
    ),
    receiveTimeout: Duration(
      seconds: int.parse(
          Environments.param(Constants.ENV_REST_CLIENTE_RECEIVE_TIMEOUT_KEY) ??
              '0'),
    ),
  );

  DioRestClient({
    required AppLogger log,
    required LocalStorage localStorage,
    required AuthStore authStore,
    BaseOptions? baseOptions,
  }) {
    _dio = Dio(baseOptions ?? _defaultOptions);
    _dio.interceptors.addAll([
      AuthInterceptors(
        localStorage: localStorage,
        log: log,
        authStore: authStore,
      ),
      LogInterceptor(requestBody: true, responseBody: true),
    ]);
  }

  @override
  RestClient auth() {
    _defaultOptions.extra[Constants.REST_CLIENT_AUTH_REQUIRED_KEY] = true;
    return this;
  }

  @override
  RestClient unauth() {
    _defaultOptions.extra[Constants.REST_CLIENT_AUTH_REQUIRED_KEY] = false;
    return this;
  }

  @override
  Future<RestClientResponse<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post<T>(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientExeption(e);
    }
  }

  @override
  Future<RestClientResponse<T>> delete<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientExeption(e);
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientExeption(e);
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientExeption(e);
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientExeption(e);
    }
  }

  @override
  Future<RestClientResponse<T>> request<T>(String path,
      {required String method,
      data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          method: method,
        ),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientExeption(e);
    }
  }

  Future<RestClientResponse<T>> _dioResponseConverter<T>(
      Response<dynamic> response) async {
    return RestClientResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  Never _throwRestClientExeption(DioException dioException) {
    final response = dioException.response;
    throw RestClientException(
      error: dioException.error,
      message: dioException.response?.statusMessage,
      statusCode: dioException.response?.statusCode,
      response: RestClientResponse(
        data: response?.data,
        statusCode: response?.statusCode,
        statusMessage: response?.statusMessage,
      ),
    );
  }
}
