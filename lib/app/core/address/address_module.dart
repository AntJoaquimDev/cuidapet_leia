import 'package:cuidapet_leia/app/core/address/address_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddressModule extends Module {

   @override
   List<Bind>  binds = [];

   @override
   List<ModularRoute> routes = [
      ChildRoute(Modular.initialRoute, child: (_,__) => const AddressPage()),
   ];

}
