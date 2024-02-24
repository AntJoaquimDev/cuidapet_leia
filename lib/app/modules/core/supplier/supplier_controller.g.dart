// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SupplierController on SupplierControllerBase, Store {
  late final _$_supplierModelAtom =
      Atom(name: 'SupplierControllerBase._supplierModel', context: context);

  SupplierModel? get supplierModel {
    _$_supplierModelAtom.reportRead();
    return super._supplierModel;
  }

  @override
  SupplierModel? get _supplierModel => supplierModel;

  @override
  set _supplierModel(SupplierModel? value) {
    _$_supplierModelAtom.reportWrite(value, super._supplierModel, () {
      super._supplierModel = value;
    });
  }

  late final _$_supplierListServicesAtom = Atom(
      name: 'SupplierControllerBase._supplierListServices', context: context);

  List<SupplierServicesModel> get supplierListServices {
    _$_supplierListServicesAtom.reportRead();
    return super._supplierListServices;
  }

  @override
  List<SupplierServicesModel> get _supplierListServices => supplierListServices;

  @override
  set _supplierListServices(List<SupplierServicesModel> value) {
    _$_supplierListServicesAtom.reportWrite(value, super._supplierListServices,
        () {
      super._supplierListServices = value;
    });
  }

  late final _$_servicesSelectedAtom =
      Atom(name: 'SupplierControllerBase._servicesSelected', context: context);

  ObservableList<SupplierServicesModel> get servicesSelected {
    _$_servicesSelectedAtom.reportRead();
    return super._servicesSelected;
  }

  @override
  ObservableList<SupplierServicesModel> get _servicesSelected =>
      servicesSelected;

  @override
  set _servicesSelected(ObservableList<SupplierServicesModel> value) {
    _$_servicesSelectedAtom.reportWrite(value, super._servicesSelected, () {
      super._servicesSelected = value;
    });
  }

  late final _$_findSupplierByIdAsyncAction =
      AsyncAction('SupplierControllerBase._findSupplierById', context: context);

  @override
  Future<void> _findSupplierById() {
    return _$_findSupplierByIdAsyncAction.run(() => super._findSupplierById());
  }

  late final _$_findSupplierSerrvicesAsyncAction = AsyncAction(
      'SupplierControllerBase._findSupplierSerrvices',
      context: context);

  @override
  Future<void> _findSupplierSerrvices() {
    return _$_findSupplierSerrvicesAsyncAction
        .run(() => super._findSupplierSerrvices());
  }

  late final _$SupplierControllerBaseActionController =
      ActionController(name: 'SupplierControllerBase', context: context);

  @override
  void addOrRemoverService(SupplierServicesModel supplierServicesModel) {
    final _$actionInfo = _$SupplierControllerBaseActionController.startAction(
        name: 'SupplierControllerBase.addOrRemoverService');
    try {
      return super.addOrRemoverService(supplierServicesModel);
    } finally {
      _$SupplierControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
