
import 'package:cuidapet_leia/app/modules/address/address_detail/address_detail_controller.dart';
import 'package:cuidapet_leia/app/modules/address/address_detail/address_detail_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddressDetailModule extends Module{

   @override
   List<Bind<Object>> get binds => [
    //Bind.lazySingleton((i) => AddressDetailController(addressService: i())),
    Bind.lazySingleton((i) => AddressDetailController()),
   ];

   @override
   List<ModularRoute>get routes => [
      ChildRoute('/', child: (context,args) => AddressDetailPage(place: args.data)),
   ];
}