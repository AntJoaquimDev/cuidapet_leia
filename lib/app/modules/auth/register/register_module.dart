

import 'package:cuidapet_leia/app/modules/auth/register/register_controller.dart';
import 'package:cuidapet_leia/app/modules/auth/register/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {

   @override
   List<Bind> get binds => [
    Bind.lazySingleton((i) => RegisterController(userService: i(), log: i())),
   ];

   @override
   List<ModularRoute> get routes => [
      ChildRoute(Modular.initialRoute, child: (_,__) => const RegisterPage())
   ];



}