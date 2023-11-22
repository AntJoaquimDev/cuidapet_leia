import 'package:cuidapet_leia/app/core/logger/app_logger.dart';
import 'package:cuidapet_leia/app/exceptions/failure_exception.dart';
import 'package:cuidapet_leia/app/exceptions/user_notexists_exception.dart';
import 'package:cuidapet_leia/app/models/social_login_type.dart';
import 'package:cuidapet_leia/app/modules/auth/login/widgets/loader.dart';
import 'package:cuidapet_leia/app/modules/auth/login/widgets/message_alert.dart';
import 'package:cuidapet_leia/app/services/user/user_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {

final UserService _userService;
  final AppLogger _log;
  LoginControllerBase({
    required UserService userService,
    required AppLogger log,
  })  : _userService = userService,
        _log =log;


        Future<void>login(String email, String password)async{
           try {
              Loader.show();
           await _userService.login(email, password);
            Loader.hide();
            Modular.to.navigate('/auth/');
           } on FailureException catch (e,s) {
            final erroMessage=e.message??'erro ao tentar fazer login';
            _log.error(erroMessage,e,s);
             Loader.hide();
             MessageAlert.alert(erroMessage);
           } on UserNotExistsException  {
             const erroMessage= 'Usuário não existe ou não encontrado ';
            _log.error(erroMessage);
             Loader.hide();
             MessageAlert.alert(erroMessage);
           }

        }

          Future<void> socialLogin(SocialLoginType socialLoginType) async {
    try {
      Loader.show();
      _userService.socialLogin(socialLoginType);
      Loader.hide();
      Modular.to.navigate('/auth/');
    } on FailureException catch (e, s) {
      Loader.hide();
      _log.error('Erro ao realizar login', e, s);
      MessageAlert.alert(e.message ?? 'Erro ao realizar loginT.');
    }
  }

}