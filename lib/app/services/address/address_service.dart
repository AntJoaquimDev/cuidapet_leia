
 import 'package:cuidapet_leia/app/entities/address_entity.dart';
import 'package:cuidapet_leia/app/models/place_model.dart';

abstract interface class AddressService {
  
  Future<List<PlaceModel>> findAddressByGooglePlaces(String addressPattern);
Future<List<AddressEntity>> getAddress();
  Future<AddressEntity> saveAddress(PlaceModel placeModel, String additional);
  Future<void> deleteAll();
  Future<void> selectAddress(AddressEntity addressEntity);
  Future<AddressEntity?> getAddressSelected();
}