
import 'package:cuidapet_leia/app/core/logger/app_logger_impl.dart';
import 'package:cuidapet_leia/app/core/rest_client/dio/dio_rest_client.dart';
import 'package:cuidapet_leia/app/core/rest_client/rest_client.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

import 'auth/auth_store.dart';

class CoreModule extends Module {

  @override
  List<Bind>  get binds => [


     Bind.lazySingleton((i) => AuthStore(), export: true),
   
    //Bind.singleton<Logger>((i) => AppLoggerImpl(), export: true),
    Bind.singleton((i) => AuthStore(),export: true),
    Bind.lazySingleton((i) => AppLoggerImpl(),export: true),
    Bind.lazySingleton((i) => DioRestClient(),export: true),

  ];
  


}
