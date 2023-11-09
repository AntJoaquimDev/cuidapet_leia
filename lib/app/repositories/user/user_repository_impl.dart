import 'dart:io';

import 'package:cuidapet_leia/app/core/logger/app_logger.dart';
import 'package:cuidapet_leia/app/core/rest_client/dio/rest_client_exception.dart';
import 'package:cuidapet_leia/app/core/rest_client/rest_client.dart';
import 'package:cuidapet_leia/app/exceptions/failure_exception.dart';
import 'package:cuidapet_leia/app/exceptions/user_existe_exception.dart';

import './user_repository.dart' show UserRepository;

class UserRepositoryImpl implements UserRepository {
  final RestClient _restClient;
  final AppLogger _log;
  
  UserRepositoryImpl({
    required RestClient restClient,
    required AppLogger log,
  })  : _restClient = restClient,
        _log = log;

  @override
  Future<void> register(String email, String password) async {
    try {
      await _restClient
          .unauth().post(
            '/auth/register',
             data: {
                'mail': email,
                'password': password,
      });
    } on RestClientException catch (e, s) {
      if (e.statusCode == HttpStatus.badRequest &&
          e.response.data['message'].contains('Usuário já cadastrado')) {
        _log.error(e.error, e, s);
        throw UserExisteException();
      }
      _log.error('Erro ao cadastarr usuário', e, s);
      throw FailureException(message: 'Erro ao Registar usuário');
    }
  }
}
