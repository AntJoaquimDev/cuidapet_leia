
import 'package:cuidapet_leia/app/entities/address_entity.dart';
import 'package:cuidapet_leia/app/exceptions/supplier_category_model.dart';
import 'package:cuidapet_leia/app/models/supplier_model.dart';
import 'package:cuidapet_leia/app/models/supplier_nearby_me_model.dart';
import 'package:cuidapet_leia/app/models/supplier_services_model.dart';

abstract class SupplierService {
  Future<List<SupplierCategoryModel>> getCategories();
  Future<List<SupplierNearbyMeModel>> findNearBy(AddressEntity address);
   Future<SupplierModel> getSupplierById(int id);
  Future<List<SupplierServicesModel>> getServices(int supplierId);
}

