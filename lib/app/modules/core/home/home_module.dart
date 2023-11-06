import 'package:cuidapet_leia/app/modules/core/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];


 @override
  List<ModularRoute>get routes => [
     ChildRoute(Modular.initialRoute, child: (_,__)=>const HomePage())
      ];

}
