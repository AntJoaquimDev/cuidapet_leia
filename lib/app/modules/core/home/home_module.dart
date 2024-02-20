import 'package:cuidapet_leia/app/modules/core/home/home_controller.dart';
import 'package:cuidapet_leia/app/modules/core/home/home_page.dart';
import 'package:cuidapet_leia/app/modules/core/supplier/supplie_core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds =>
      [Bind.singleton((i) => HomeController(addressService: i(),supplierService: i()))];

  @override
  List<Module> get imports => [
        SupplieCoreModule(),
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute(Modular.initialRoute, child: (_, __) =>  const HomePage())];
}
