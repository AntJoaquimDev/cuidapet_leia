import 'package:cuidapet_leia/app/core/aplication_config.dart';
import 'package:cuidapet_leia/app_module.dart';
import 'package:cuidapet_leia/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> main() async {
  
  AplicationConfig().configureApp();
  await dotenv.load(fileName: ".env");

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
