import 'dart:io';

import 'package:cuidapet_leia/app/core/logger/app_logger.dart';
import 'package:cuidapet_leia/app/core/rest_client/dio/rest_client_exception.dart';
import 'package:cuidapet_leia/app/core/rest_client/rest_client.dart';
import 'package:cuidapet_leia/app/exceptions/failure_exception.dart';
import 'package:cuidapet_leia/app/exceptions/user_existe_exception.dart';
import 'package:cuidapet_leia/app/models/confirm_login_model.dart';
import 'package:cuidapet_leia/app/models/user_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

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
      await _restClient.unauth().post('/auth/register', data: {
        'email': email,
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

  @override
  Future<String> login(String email, String password) async {
    try {
      final restClient = _restClient.unauth();
      final result = await restClient.post(
        '/auth/',
        data: {
          'login': email,
          'password': password,
          'social_login': false,
          'supplier_user': false,
        },
      );
      return result.data['access_token'];
    } on RestClientException catch (e, s) {
      _log.error('Erro ao realizar login.', e, s);
      if (e.statusCode == 403) {
        throw FailureException(
            message: 'Usuário inconsistente entre em contato com o suporte!');
      }

      throw FailureException(
          message: 'Erro ao realizar login, tente novamente!');
    }
  }

  @override
  Future<ConfirLoginModel> confirmeLogin() async {
    try {
      final deviceToken = await FirebaseMessaging.instance.getToken();
      final result = await _restClient.auth().patch('/auth/confirm', data: {
        'ios_token': Platform.isIOS ? deviceToken : null,
        'android_token': Platform.isAndroid ? deviceToken : null
      });
      final code =  result.statusCode;
      print(deviceToken);
      print(code);
      return ConfirLoginModel.fromMap(result.data);
    } on RestClientException catch (e, s) {
      _log.error('Erro ao confirmar Login', e, s);
      throw FailureException(message: 'Erro ao confirmar Login');
    }
  }
    @override
  Future<UserModel> getUserLogged() async {
    try {
      final result = await _restClient.get('/user/');
      return UserModel.fromMap(result.data);
    } on RestClientException catch (e, s) {
      _log.error('Erro ao buscar dados do usuário logado.', e, s);
      throw FailureException(message: 'Erro ao buscar dados do usuários logado.');
    }
  }

}
