import 'package:cuidapet_leia/app/modules/auth/login/login_controller.dart';
import 'package:cuidapet_leia/app/modules/auth/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds =>[
     Bind((i) => LoginController(userService: i(), log: i())),
  ];

  @override
  List<ModularRoute> get routes =>[
    ChildRoute(Modular.initialRoute, child: (_,__) =>LoginPage()),

  ];
}
