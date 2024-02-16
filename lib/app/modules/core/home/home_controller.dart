import 'package:cuidapet_leia/app/core/life_cycle/controller_life_cycle.dart';
import 'package:cuidapet_leia/app/core/ui/widgets/cuidapat_messages.dart';
import 'package:cuidapet_leia/app/entities/address_entity.dart';
import 'package:cuidapet_leia/app/exceptions/supplier_category_model.dart';
import 'package:cuidapet_leia/app/models/supplier_nearby_me_model.dart';
import 'package:cuidapet_leia/app/modules/auth/login/widgets/loader.dart';
import 'package:cuidapet_leia/app/services/address/address_service.dart';
import 'package:cuidapet_leia/app/services/supplier/supplier_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

enum SupplierPageType { list, grid }

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store, ControllerLifeCycle {
  final AddressService _addressService;
  final SupplierService _supplierService;

  @readonly
  AddressEntity? _addressEntity;

  @readonly
  var _listCategories = <SupplierCategoryModel>[];
  @readonly
  var _supplierPageTypeSelected = SupplierPageType.list;

  @readonly
  var _listSupplierByAddress = <SupplierNearbyMeModel>[];

  @readonly
  var _listSupplierByAddressCache = <SupplierNearbyMeModel>[];

  var _nameSearchText = '';

  @readonly
  SupplierCategoryModel? _supplierCategoryFilterSelected;

  late ReactionDisposer findSupplierReactionDisposer;

  HomeControllerBase({
    required AddressService addressService,
    required SupplierService supplierService,
  })  : _addressService = addressService,
        _supplierService = supplierService;

  @override
  void onInit([Map<String, dynamic>? params]) {
    findSupplierReactionDisposer = reaction(
      (_) => _addressEntity,
      (_) => findSupplierByAddress(),
    );
  }

  @override
  void dispose() {
    findSupplierReactionDisposer;
  }

  @override
  Future<void> onReady() async {
    try {
      Loader.show();

      //    await Future.wait([_getAddressSelected(), _getCategories()]);
      //  if(_addressEntity !=null){
      //   await _supplierService.getServices(supplierId)
      //  }
      _getAddressSelected();
      _getCategories();

      Loader.hide();
    } finally {
      Loader.hide();
    }
  }

  Future<void> _getAddressSelected() async {
    _addressEntity ??= await _addressService.getAddressSelected();

    if (_addressEntity == null) {
      goToAddressPage();
    }
  }

  @action
  Future<void> goToAddressPage() async {
    final address = await Modular.to.pushNamed<AddressEntity>('/address/');
    if (address != null) {
      _addressEntity = address;
    }
  }

  @action
  Future<void> _getCategories() async {
    try {
      final categories = await _supplierService.getCategories();
      _listCategories = [...categories];
    } catch (e) {
      CuidapetMessages.alert('Erro ao buscar categorias');
      throw Exception();
    }
  }

  @action
  Future<void> changeTabSupplier(SupplierPageType supplierPageType) async {
    _supplierPageTypeSelected = supplierPageType;
  }

  Future<void> findSupplierByAddress() async {
    if (_addressEntity != null) {
      final suppliers = await _supplierService.findNearBy(_addressEntity!);
      _listSupplierByAddress = [...suppliers];
      _listSupplierByAddressCache = [...suppliers];
      filterSuplier();
    } else {
      CuidapetMessages.alert(
          'Para Realizar a busca de um petshop, voçê precisa selecionar um endereço.');
    }
  }

  @action
  void filterSupplierCategory(SupplierCategoryModel category) {
    if (_supplierCategoryFilterSelected == category) {
      _supplierCategoryFilterSelected = null;
    } else {
      _supplierCategoryFilterSelected = category;
    }
    filterSuplier();
  }

  void filterSupplieByName(String name) {
    _nameSearchText = name;
    filterSuplier();
  }

  @action
  void filterSuplier() {
    var suppliers = [..._listSupplierByAddressCache];

    if (_supplierCategoryFilterSelected != null) {
      suppliers = suppliers
          .where((supplier) =>
              supplier.category == _supplierCategoryFilterSelected?.id)
          .toList();
    }
    if (_nameSearchText.isNotEmpty) {
      suppliers = suppliers
          .where((supplier) => supplier.name
              .toLowerCase()
              .contains(_nameSearchText.toLowerCase()))
          .toList();
    }
    _listSupplierByAddress = [...suppliers];
  }
}
