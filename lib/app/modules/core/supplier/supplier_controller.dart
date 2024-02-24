import 'package:cuidapet_leia/app/core/life_cycle/controller_life_cycle.dart';
import 'package:cuidapet_leia/app/core/logger/app_logger.dart';
import 'package:cuidapet_leia/app/models/supplier_model.dart';
import 'package:cuidapet_leia/app/models/supplier_services_model.dart';
import 'package:cuidapet_leia/app/modules/auth/login/widgets/loader.dart';
import 'package:cuidapet_leia/app/modules/auth/login/widgets/message_alert.dart';
import 'package:cuidapet_leia/app/modules/schedules/model/schedules_view_model.dart';
import 'package:cuidapet_leia/app/services/supplier/supplier_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
part 'supplier_controller.g.dart';

class SupplierController = SupplierControllerBase with _$SupplierController;

abstract class SupplierControllerBase with Store, ControllerLifeCycle {
  final SupplierService _supplierService;
  final AppLogger _log;

  int _supplierId = 0;
  @readonly
  SupplierModel? _supplierModel;
  @readonly
  var _supplierListServices = <SupplierServicesModel>[];

  @readonly
  // ignore: prefer_final_fields
  var _servicesSelected = <SupplierServicesModel>[].asObservable();

  SupplierControllerBase({
    required SupplierService supplierService,
    required AppLogger log,
  })  : _supplierService = supplierService,
        _log = log;

  @override
  void onInit([Map<String, dynamic>? params]) {
    _supplierId = params?['supplierId'] ?? 0;

    super.onInit(params);
  }

  @override
  void onReady() async {
    try {
      Loader.show();

      await Future.wait([
        _findSupplierById(),
        _findSupplierSerrvices(),
      ]);

      super.onReady();
    } finally {
      Loader.hide();
    }
  }

  @action
  Future<void> _findSupplierById() async {
    try {
      _supplierModel = await _supplierService.getSupplierById(_supplierId);
    } catch (e, s) {
      const message = 'Erro ao buscar dados do Fornecedo.';
      _log.error(message, e, s);
      MessageAlert.alert(message);
    }
  }

  @action
  Future<void> _findSupplierSerrvices() async {
    try {
      _supplierListServices = await _supplierService.findServices(_supplierId);
    } catch (e, s) {
      const message = 'Erro ao buscar Serviços do Fornecedo.';
      _log.error(message, e, s);
      MessageAlert.alert(message);
    }
  }

  @action
  void addOrRemoverService(SupplierServicesModel supplierServicesModel) {
    if (_servicesSelected.contains(supplierServicesModel)) {
      _servicesSelected.remove(supplierServicesModel);
    } else {
      _servicesSelected.add(supplierServicesModel);
    }
  }

  bool isServiceSelected(SupplierServicesModel servicesModel) {
    return _servicesSelected.contains(servicesModel);
  }

  int get totalSelected => _servicesSelected.length;

  Future<void> goToPhoneCopyToClipat() async {
    final phoneUrl = 'tel:${_supplierModel?.phone}';
    if (await canLaunchUrlString(phoneUrl)) {
      await launchUrlString(phoneUrl);
    } else {
      await Clipboard.setData(ClipboardData(text: _supplierModel?.phone ?? ''));
      MessageAlert.info('Contato copiado');
    }
  }

  Future<void> goToGeoCopyToClipat() async {
    final geoUrl = 'geo:${_supplierModel?.lat},${_supplierModel?.lng}';
    if (await canLaunchUrlString(geoUrl)) {
      await launchUrlString(geoUrl);
    } else {
      await Clipboard.setData(
          ClipboardData(text: _supplierModel?.address ?? ''));
      MessageAlert.info('Endereço copiado');
    }
  }

  void goToSchedule() {
    Modular.to.pushNamed('/schedules/',
        arguments: SchedulesViewModel(
          supplierId: _supplierId,
          services: _servicesSelected.toList(),
        ));
  }
}
