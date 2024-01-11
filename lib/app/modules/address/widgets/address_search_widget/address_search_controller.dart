import 'package:cuidapet_leia/app/models/place_model.dart';
import 'package:cuidapet_leia/app/services/address/address_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'address_search_controller.g.dart';

class AddressSearchController = AddressSearchControllerBase
    with _$AddressSearchController;

abstract class AddressSearchControllerBase with Store {
  final AddressService _addressService;

  AddressSearchControllerBase()
      : _addressService = Modular.get<AddressService>();

  Future<List<PlaceModel>> searchAddress(String addressPattern) =>
      _addressService.findAddressByGooglePlaces(addressPattern);
}
