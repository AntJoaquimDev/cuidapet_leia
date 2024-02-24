import 'package:cuidapet_leia/app/modules/core/supplier/supplie_core_module.dart';
import 'package:cuidapet_leia/app/modules/core/supplier/supplier_controller.dart';
import 'package:cuidapet_leia/app/modules/core/supplier/supplier_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SupplierModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
            (i) => SupplierController(supplierService: i(), log: i())),
      ];
  @override
  List<Module> get imports => [SupplieCoreModule()];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) =>  SupplierPage(supplierId: args.data),
        ),
      ];
}
