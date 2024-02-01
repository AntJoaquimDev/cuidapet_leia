import 'package:cuidapet_leia/app/core/life_cycle/controller_life_cycle.dart';
import 'package:cuidapet_leia/app/entities/address_entity.dart';
import 'package:cuidapet_leia/app/modules/auth/login/widgets/loader.dart';
import 'package:cuidapet_leia/app/services/address/address_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store, ControllerLifeCycle {
final AddressService _addressService;
 // final SupplierService _supplierService;

HomeControllerBase({ required AddressService addressService,
}):_addressService=addressService;
 

  @readonly
  AddressEntity? _addressEntity;
  
  @override
  void onReady() async {
    
    Loader.show();
await _getAddressSelected();

    Loader.hide();
  }
  
  _getAddressSelected() async{
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
 
}



/*void onReady() async {
    await _hasRegisterAddress();
  }

  Future<void> _hasRegisterAddress() async {
    await Modular.to.pushNamed('/address/');
  }
} */