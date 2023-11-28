// import 'package:cuidapet_leia/app/core/database/sqlite_connection_factory.dart';
// import 'package:cuidapet_leia/app/entities/address_entity.dart';

// import 'package:cuidapet_leia/app/models/place_model.dart';

// import 'address_repository.dart';

// class AddressRepositoryImpl implements AddressRepository {
//    final SqliteConnectionFactory _sqliteConnectionFactory;



//   const AddressRepositoryImpl({
//     required SqliteConnectionFactory sqliteConnectionFactory,
//   }) : _sqliteConnectionFactory = sqliteConnectionFactory;
//   @override
//   Future<List<PlaceModel>> findAddressByGooglePlaces(String addressPattern) {
//     // TODO: implement findAddressByGooglePlaces
//     throw UnimplementedError();
//   }

//   @override
//   Future<List<AddressEntity>> getAddress() {
//     // TODO: implement getAddress
//     throw UnimplementedError();
//   }

//   @override
//   Future<int> saveAddress(AddressEntity entity) {
//     // TODO: implement saveAddress
//     throw UnimplementedError();
//   }
//   @override
//   Future<void> deleteAll()async {
//     final sqliteConn = await _sqliteConnectionFactory.openConnection();
//     await sqliteConn.delete('address');
//   }

// }