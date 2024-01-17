
import 'package:cuidapet_leia/app/core/local_stoge/flutter_secure_store/flutter_secure_store_local_storage_impl.dart';
import 'package:cuidapet_leia/app/core/local_stoge/local_storage.dart';
import 'package:cuidapet_leia/app/core/local_stoge/shared_preferences/shared_preferences_local_storage_impl.dart';
import 'package:cuidapet_leia/app/core/logger/app_logger_impl.dart';
import 'package:cuidapet_leia/app/core/rest_client/dio/dio_rest_client.dart';
import 'package:cuidapet_leia/app/core/rest_client/rest_client.dart';
import 'package:cuidapet_leia/app/repositories/address/address_repository.dart';
import 'package:cuidapet_leia/app/repositories/address/address_repository_impl.dart';
import 'package:cuidapet_leia/app/services/address/address_service.dart';
import 'package:cuidapet_leia/app/services/address/address_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_places/google_places.dart';

import 'auth/auth_store.dart';

class CoreModule extends Module {

  @override
  List<Bind>   binds = [
   
    Bind.lazySingleton((i) => AppLoggerImpl(),export: true),
    
    Bind.lazySingleton<LocalStorage>((i) => SharedPreferencesLocalStorageImpl(), export: true),
    Bind.lazySingleton<LocalSecureStorage>((i) => FlutterSecureStoreLocalStorageImpl (), export: true),
    Bind.lazySingleton((i) => AuthStore(localStorage: i()),export: true),
    Bind.lazySingleton<AddressRepository>((i) => AddressRepositoryImpl(),export: true),
    Bind.lazySingleton<RestClient>((i) => DioRestClient(localStorage: i(),log: i(),authStore: i(),localSecureStorage: i()),export: true),
    Bind.lazySingleton<AddressRepository>((i) => AddressRepositoryImpl(),export: true),
   Bind.lazySingleton<AddressService>((i) => AddressServiceImpl(addressRepository: i(),),export: true),// localStorage: i()

  ];
  


}
