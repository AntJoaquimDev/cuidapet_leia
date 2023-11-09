import 'package:cuidapet_leia/app/core/helpers/constants.dart';
import 'package:cuidapet_leia/app/core/helpers/environments.dart';
import 'package:cuidapet_leia/app/core/rest_client/dio/rest_client_exception.dart';
import 'package:dio/dio.dart';

import 'package:cuidapet_leia/app/core/rest_client/rest_client.dart';
import 'package:cuidapet_leia/app/core/rest_client/rest_client_response.dart';

class DioRestClient implements RestClient {
  late final Dio _dio;  

  final _defaultOptions = BaseOptions(
    baseUrl: Environments.param(Constants.ENV_BASE_URL_KEY) ?? '',
      connectTimeout: Duration(
        seconds: int.parse(Environments.param(Constants.ENV_REST_CLIENT_CONECT_TIMEOUT)??'0'),),
    receiveTimeout:
        Duration(seconds: int.parse(Environments.param(Constants.ENV_REST_CLIENT_RECIVE_TIMEOUTT)??'0'),),
  );
  
  DioRestClient({
    BaseOptions? baseOptions,
  }) {
    _dio = Dio(baseOptions ?? _defaultOptions);
  }


  @override
  RestClient auth() {
    _defaultOptions.extra['auth_required'] = true;
    return this;
  }

  @override
  RestClient unauth() {
    _defaultOptions.extra['auth_required'] = false;
    return this;
  }

  @override
  Future<RestClientResponse<T>> post<T>(String path,
   {
    data, Map<String, dynamic>? queryParameter, 
   Map<String, dynamic>? headers,}) async{
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameter,
        options: Options(headers: headers));

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientExeption(e);
    
  }
  }

  @override
  Future<RestClientResponse<T>> delete<T>(String path,
      {data,
      Map<String, dynamic>? queryParameter,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameter,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientExeption(e);
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameter,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameter,
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
      Map<String, dynamic>? queryParameter,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameter,
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
      Map<String, dynamic>? queryParameter,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameter,
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
      Map<String, dynamic>? queryParameter,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameter,
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
