
import 'package:cuidapet_leia/app/models/supplier_services_model.dart';

class SchedulesViewModel {
  final int supplierId;
  final List<SupplierServicesModel> services;
  SchedulesViewModel({
    required this.supplierId,
    required this.services,
  });
}
