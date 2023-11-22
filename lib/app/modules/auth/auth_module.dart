import 'package:cuidapet_leia/app/core/rest_client/dio/dio_rest_client.dart';
import 'package:cuidapet_leia/app/core/rest_client/rest_client.dart';
import 'package:cuidapet_leia/app/modules/auth/home/auth_home_page.dart';
import 'package:cuidapet_leia/app/modules/auth/login/login_module.dart';
import 'package:cuidapet_leia/app/modules/auth/register/register_module.dart';
import 'package:cuidapet_leia/app/modules/core/auth/auth_store.dart';
import 'package:cuidapet_leia/app/repositories/user/user_repository.dart';
import 'package:cuidapet_leia/app/repositories/user/user_repository_impl.dart';
import 'package:cuidapet_leia/app/services/user/user_service.dart';
import 'package:cuidapet_leia/app/services/user/user_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<Bind>  binds = [
       
        Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(
              log: i(),
              restClient: i(),
            )),
        Bind.lazySingleton<UserService>((i) => UserServiceImpl(
            log: i(),
            userRepository: i(),
            localStorage: i(),
            localSecureStoge: i(),
          )
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) =>
                AuthHomePage(authStore: Modular.get<AuthStore>())),
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/register', module: RegisterModule()),
      ];
}
