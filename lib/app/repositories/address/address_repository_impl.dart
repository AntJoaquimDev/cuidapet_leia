import 'package:cuidapet_leia/app/core/database/sqlite_connection_factory.dart';
import 'package:cuidapet_leia/app/core/helpers/environments.dart';
import 'package:cuidapet_leia/app/entities/address_entity.dart';
import 'package:cuidapet_leia/app/exceptions/failure_exception.dart';
import 'package:cuidapet_leia/app/models/place_model.dart';
import 'package:google_places/google_places.dart';

import 'address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  // final SqliteConnectionFactory _sqliteConnectionFactory;



  // const AddressRepositoryImpl({
  //   required SqliteConnectionFactory sqliteConnectionFactory,
  // }) //: _sqliteConnectionFactory = sqliteConnectionFactory;
  @override
  Future<List<PlaceModel>> findAddressByGooglePlaces(String addressPattern)async {
    final googleApiKey = Environments.param('google_api_key');

    if (googleApiKey == null) {
      throw FailureException(message: 'Google Api Key Not Found');
    }
    final googlePlace = GooglePlaces(googleApiKey);
     final addressResult =
        await googlePlace.search.getTextSearch(addressPattern);
    final candidates = addressResult?.results;

    if (candidates != null) {
      return candidates.map<PlaceModel>((searchResult) {
        final location = searchResult.geometry?.location;
        final address = searchResult.formattedAddress;

        return PlaceModel(
          address: address ?? '',
          lat: location?.lat ?? 0,
          lng: location?.lng ?? 0,
        );
      }).toList();
    }

    return <PlaceModel>[];
  }
  
  @override
  Future<List<AddressEntity>> getAddress() {
    // TODO: implement getAddress
    throw UnimplementedError();
  }

  @override
  Future<int> saveAddress(AddressEntity entity) {
    // TODO: implement saveAddress
    throw UnimplementedError();
  }
  @override
  Future<void> deleteAll()async {
    // final sqliteConn = await _sqliteConnectionFactory.openConnection();
    // await sqliteConn.delete('address');
  
  }

}