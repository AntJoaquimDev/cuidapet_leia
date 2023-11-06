import 'package:cuidapet_leia/app/core/logger/app_logger.dart';
import 'package:cuidapet_leia/app/core/rest_client/dio/rest_client_exception.dart';
import 'package:cuidapet_leia/app/core/rest_client/rest_client.dart';
import 'package:cuidapet_leia/app/exceptions/failure_exception.dart';
import 'package:cuidapet_leia/app/exceptions/user_existe_exception.dart';

import './user_repository.dart' show UserRepository;

class UserRepositoryImpl implements UserRepository {
  final RestClient _restClient;
  final AppLogger _logger;
  UserRepositoryImpl({
    required RestClient restClient,
    required AppLogger logger,
  })  : _restClient = restClient,
        _logger = logger;

  @override
  Future<void> register(String email, String password) async {
    try {
      await _restClient
          .unauth()
          .post('http://192.168.3.62:8080/auth/register', data: {
        "email": email,
        "password": password,
      });
    } on RestClientException catch (e, s) {
      if (e.statusCode == 400 &&
          e.response.data['message'].contains('Usuário já cadastrado')) {
        _logger.error(e.error, e, s);
        throw UserExisteException();
      }
      _logger.error('Erro ao cadastarr usuário', e, s);
      throw FailureException(message: 'Erro ao Registar usuário');
    }
  }
}
