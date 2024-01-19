import 'package:cuidapet_leia/app/core/local_stoge/local_storage.dart';
import 'package:cuidapet_leia/app/entities/address_entity.dart';

import 'package:cuidapet_leia/app/models/place_model.dart';
import 'package:cuidapet_leia/app/repositories/address/address_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'address_service.dart';

class AddressServiceImpl implements AddressService {
  final AddressRepository _addressRepository;
  final LocalStorage _localStorage;

  AddressServiceImpl({
    required AddressRepository addressRepository,
    required LocalStorage localStorage,
  })  : _addressRepository = addressRepository,
        _localStorage = localStorage;

  @override
  Future<void> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<List<PlaceModel>> findAddressByGooglePlaces(String addressPattern) =>
      _addressRepository.findAddressByGooglePlaces(addressPattern);

  @override
  Future<List<AddressEntity>> getAddress() {
   return _addressRepository.getAddress();
  }

  @override
  Future<AddressEntity?> getAddressSelected() {
    // TODO: implement getAddressSelected
    throw UnimplementedError();
  }

  @override
  Future<AddressEntity> saveAddress(PlaceModel placeModel, String additional)async {
    final addressEntity = AddressEntity(
      address: placeModel.address,
      lat: placeModel.lat,
      lng: placeModel.lng,
      additional: additional,
    );
    var addressId = await _addressRepository.saveAddress(addressEntity);
    return addressEntity.copyWith(id: addressId);
  }

  @override
  Future<void> selectAddress(AddressEntity addressEntity) {
    // TODO: implement selectAddress
    throw UnimplementedError();
  }
}
