// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$_addressEntityAtom =
      Atom(name: 'HomeControllerBase._addressEntity', context: context);

  AddressEntity? get addressEntity {
    _$_addressEntityAtom.reportRead();
    return super._addressEntity;
  }

  @override
  AddressEntity? get _addressEntity => addressEntity;

  @override
  set _addressEntity(AddressEntity? value) {
    _$_addressEntityAtom.reportWrite(value, super._addressEntity, () {
      super._addressEntity = value;
    });
  }

  late final _$_listCategoriesAtom =
      Atom(name: 'HomeControllerBase._listCategories', context: context);

  List<SupplierCategoryModel> get listCategories {
    _$_listCategoriesAtom.reportRead();
    return super._listCategories;
  }

  @override
  List<SupplierCategoryModel> get _listCategories => listCategories;

  @override
  set _listCategories(List<SupplierCategoryModel> value) {
    _$_listCategoriesAtom.reportWrite(value, super._listCategories, () {
      super._listCategories = value;
    });
  }

  late final _$_supplierPageTypeSelectedAtom = Atom(
      name: 'HomeControllerBase._supplierPageTypeSelected', context: context);

  SupplierPageType get supplierPageTypeSelected {
    _$_supplierPageTypeSelectedAtom.reportRead();
    return super._supplierPageTypeSelected;
  }

  @override
  SupplierPageType get _supplierPageTypeSelected => supplierPageTypeSelected;

  @override
  set _supplierPageTypeSelected(SupplierPageType value) {
    _$_supplierPageTypeSelectedAtom
        .reportWrite(value, super._supplierPageTypeSelected, () {
      super._supplierPageTypeSelected = value;
    });
  }

  late final _$_listSupplierByAddressAtom =
      Atom(name: 'HomeControllerBase._listSupplierByAddress', context: context);

  List<SupplierNearbyMeModel> get listSupplierByAddress {
    _$_listSupplierByAddressAtom.reportRead();
    return super._listSupplierByAddress;
  }

  @override
  List<SupplierNearbyMeModel> get _listSupplierByAddress =>
      listSupplierByAddress;

  @override
  set _listSupplierByAddress(List<SupplierNearbyMeModel> value) {
    _$_listSupplierByAddressAtom
        .reportWrite(value, super._listSupplierByAddress, () {
      super._listSupplierByAddress = value;
    });
  }

  late final _$_listSupplierByAddressCacheAtom = Atom(
      name: 'HomeControllerBase._listSupplierByAddressCache', context: context);

  List<SupplierNearbyMeModel> get listSupplierByAddressCache {
    _$_listSupplierByAddressCacheAtom.reportRead();
    return super._listSupplierByAddressCache;
  }

  @override
  List<SupplierNearbyMeModel> get _listSupplierByAddressCache =>
      listSupplierByAddressCache;

  @override
  set _listSupplierByAddressCache(List<SupplierNearbyMeModel> value) {
    _$_listSupplierByAddressCacheAtom
        .reportWrite(value, super._listSupplierByAddressCache, () {
      super._listSupplierByAddressCache = value;
    });
  }

  late final _$_supplierCategoryFilterSelectedAtom = Atom(
      name: 'HomeControllerBase._supplierCategoryFilterSelected',
      context: context);

  SupplierCategoryModel? get supplierCategoryFilterSelected {
    _$_supplierCategoryFilterSelectedAtom.reportRead();
    return super._supplierCategoryFilterSelected;
  }

  @override
  SupplierCategoryModel? get _supplierCategoryFilterSelected =>
      supplierCategoryFilterSelected;

  @override
  set _supplierCategoryFilterSelected(SupplierCategoryModel? value) {
    _$_supplierCategoryFilterSelectedAtom
        .reportWrite(value, super._supplierCategoryFilterSelected, () {
      super._supplierCategoryFilterSelected = value;
    });
  }

  late final _$goToAddressPageAsyncAction =
      AsyncAction('HomeControllerBase.goToAddressPage', context: context);

  @override
  Future<void> goToAddressPage() {
    return _$goToAddressPageAsyncAction.run(() => super.goToAddressPage());
  }

  late final _$_getCategoriesAsyncAction =
      AsyncAction('HomeControllerBase._getCategories', context: context);

  @override
  Future<void> _getCategories() {
    return _$_getCategoriesAsyncAction.run(() => super._getCategories());
  }

  late final _$changeTabSupplierAsyncAction =
      AsyncAction('HomeControllerBase.changeTabSupplier', context: context);

  @override
  Future<void> changeTabSupplier(SupplierPageType supplierPageType) {
    return _$changeTabSupplierAsyncAction
        .run(() => super.changeTabSupplier(supplierPageType));
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  void filterSupplierCategory(SupplierCategoryModel category) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.filterSupplierCategory');
    try {
      return super.filterSupplierCategory(category);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterSuplier() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.filterSuplier');
    try {
      return super.filterSuplier();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
