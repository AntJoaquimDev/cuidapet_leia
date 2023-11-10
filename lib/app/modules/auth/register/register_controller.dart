import 'package:cuidapet_leia/app/exceptions/user_existe_exception.dart';
import 'package:cuidapet_leia/app/modules/auth/login/widgets/loader.dart';
import 'package:cuidapet_leia/app/modules/auth/login/widgets/message_alert.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:cuidapet_leia/app/core/logger/app_logger.dart';
import 'package:cuidapet_leia/app/services/user/user_service.dart';

part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {
  final UserService _userService;
  final AppLogger _log;
  RegisterControllerBase({
    required UserService userService,
    required AppLogger log,
  })  : _userService = Modular.get<UserService>(),
        _log = Modular.get<AppLogger>();

  Future<void> register(
      {required String email, required String password}) async {
    try {
      Loader.show();
      await _userService.register(email, password);
      Loader.hide();
    } on UserExisteException {
      Loader.hide();
      MessageAlert.alert('Email já em uso , por favor escolha outro email.');
    } catch (e, s) {
      _log.error('Erro ao Registrar usuário', e, s);

      Loader.hide();
      MessageAlert.alert('Erro ao registrar usuário.');
    }
  }
}
