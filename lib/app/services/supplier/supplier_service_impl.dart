// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cuidapet_leia/app/entities/address_entity.dart';
import 'package:cuidapet_leia/app/exceptions/supplier_category_model.dart';
import 'package:cuidapet_leia/app/models/supplier_model.dart';
import 'package:cuidapet_leia/app/models/supplier_nearby_me_model.dart';
import 'package:cuidapet_leia/app/models/supplier_services_model.dart';
import 'package:cuidapet_leia/app/repositories/supplier/supplier_repository.dart';

import './supplier_service.dart';

class SupplierServiceImpl implements SupplierService {
  final SupplierRepository _repository;

  SupplierServiceImpl({
    required SupplierRepository supplierRepository,
  }) : _repository = supplierRepository;
  @override
  Future<List<SupplierCategoryModel>> getCategories() =>
      _repository.getCategories();

  @override
  Future<List<SupplierNearbyMeModel>> findNearBy(AddressEntity address) =>
      _repository.findNearBy(address);

  @override
  Future<SupplierModel> getSupplierById(int id) => _repository.findById(id);
  @override
  Future<List<SupplierServicesModel>> findServices(int supplierId) =>
      _repository.findService(supplierId);
}
