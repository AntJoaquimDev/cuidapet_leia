import 'package:cuidapet_leia/app/core/life_cycle/controller_life_cycle.dart';
import 'package:cuidapet_leia/app/entities/address_entity.dart';
import 'package:cuidapet_leia/app/modules/auth/login/widgets/loader.dart';
import 'package:cuidapet_leia/app/services/address/address_service.dart';
import 'package:mobx/mobx.dart';
part 'address_controller.g.dart';

class AddressController = AddressControllerBase with _$AddressController;

abstract class AddressControllerBase with Store, ControllerLifeCycle {
  @readonly
  var _addresses = <AddressEntity>[];

  final AddressService _addressService;

  AddressControllerBase({required AddressService addressService})
      : _addressService = addressService;

@override
void onReady(){
  getAddress();
}


  @action
  Future<void> getAddress() async {
    Loader.show();
    _addresses = await _addressService.getAddress();
    Loader.hide();
  }
}
