import 'package:cuidapet_leia/app/repositories/supplier/supplier_repository.dart';
import 'package:cuidapet_leia/app/repositories/supplier/supplier_repository_impl.dart';
import 'package:cuidapet_leia/app/services/supplier/supplier_service.dart';
import 'package:cuidapet_leia/app/services/supplier/supplier_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SupplieCoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<SupplierRepository>(
            (i) => SupplierRepositoryImpl(restClient: i(), log: i()),
            export: true),
        Bind.lazySingleton<SupplierService>(
            (i) => SupplierServiceImpl(supplierRepository: i()),
            export: true),
      ];

  @override
  List<ModularRoute> get routes => [
       
      ];
}
