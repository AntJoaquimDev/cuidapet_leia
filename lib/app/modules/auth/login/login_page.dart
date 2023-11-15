import 'package:cuidapet_leia/app/modules/auth/login/login_controller.dart';
import 'package:flutter/material.dart';

import 'package:cuidapet_leia/app/core/helpers/environments.dart';
import 'package:cuidapet_leia/app/core/ui/extensions/size_screen_extension.dart';
import 'package:cuidapet_leia/app/core/ui/extensions/theme_extension.dart';
import 'package:cuidapet_leia/app/core/ui/icons/cuidapet_icons.dart';
import 'package:cuidapet_leia/app/core/ui/widgets/custom_butom.dart';
import 'package:cuidapet_leia/app/core/ui/widgets/custom_textform_field.dart';
import 'package:cuidapet_leia/app/modules/auth/login/widgets/custon_or_separator.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

part 'widgets/login_form.dart';
part 'widgets/login_register_buttom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
   // final url =Environments.param('base_url');
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              //Text(url ?? ''),
              const SizedBox(height: 50),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 162.w,
                  height: 130.h,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 30),
              const _LoginForm(),
              const SizedBox(height: 8),
              const CustonOrSeparator(),
              const SizedBox(height: 8),
              const _LoginRegisterButtom()
            ],
          ),
        ),
      ),
    );
  }
}
