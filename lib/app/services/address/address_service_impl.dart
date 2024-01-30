import 'package:cuidapet_leia/app/core/helpers/constants.dart';
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
  Future<AddressEntity?> getAddressSelected() async {
    final addressJson = await _localStorage
        .read(Constants.LOCAL_STORAGE_USER_DEFAULT_ADDRESS_DATA_KEY);

    if (addressJson != null) {
      return AddressEntity.fromJson(addressJson);
    }
    return null;
  }

  @override
  Future<void> selectAddress(AddressEntity addressEntity) async {
    await _localStorage.write(
        Constants.LOCAL_STORAGE_USER_DEFAULT_ADDRESS_DATA_KEY,
        addressEntity.toJson());
  }

  @override
  Future<AddressEntity> saveAddress(
      PlaceModel placeModel, String additional) async {
    final addressEntity = AddressEntity(
      address: placeModel.address,
      lat: placeModel.lat,
      lng: placeModel.lng,
      additional: additional,
    );
    var addressId = await _addressRepository.saveAddress(addressEntity);
    return addressEntity.copyWith(id: addressId);
  }
}
