import 'package:cuidapet_leia/app/modules/core/auth/auth_store.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:cuidapet_leia/app/core/helpers/constants.dart';
import 'package:dio/dio.dart';

import 'package:cuidapet_leia/app/core/local_stoge/local_storage.dart';

@JsonSerializable()
class AuthInterceptors extends Interceptor {
  LocalStorage _localStorage;
  final AuthStore _authStore;

  AuthInterceptors({
    required LocalStorage localStorage,
    required AuthStore authStore,
  })  : _localStorage = localStorage,
        _authStore = authStore;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final authRequired =
        options.extra[Constants.REST_CLIENT_AUTH_REQUIRED_KEY] ?? false;

    if (authRequired) {
      final accessToken = await _localStorage
          .read<String>(Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY);
      if (accessToken == null) {
        _authStore.logout();
        return handler.reject(DioException(
          requestOptions: options,
          error: 'Expire Token',
          type: DioExceptionType.cancel,
        ));
      }
      options.headers['Authorization'] = accessToken;
    } else {
      options.headers.remove('Authorization');
    }
    handler.next(options);
  }

  
}
