import 'package:cuidapet_leia/app/core/rest_client/rest_client_response.dart';

abstract class RestClient {
  RestClient auth();
  RestClient unauth();

  Future<RestClientResponse<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? header,
  });
  Future<RestClientResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? header,
  });

  Future<RestClientResponse<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? header,
  });

  Future<RestClientResponse<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? header,
  });
  Future<RestClientResponse<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? header,
  });
  Future<RestClientResponse<T>> request<T>(
    String path, {
    required String method,
    dynamic data,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? header,
  });
}
