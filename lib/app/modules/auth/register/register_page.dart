
import 'package:cuidapet_leia/app/core/ui/extensions/size_screen_extension.dart';
import 'package:cuidapet_leia/app/core/ui/widgets/custom_butom.dart';
import 'package:cuidapet_leia/app/core/ui/widgets/custom_textform_field.dart';
import 'package:cuidapet_leia/app/core/validator.dart';
import 'package:cuidapet_leia/app/modules/auth/login/widgets/message_alert.dart';
import 'package:cuidapet_leia/app/modules/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

part 'widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Usuario'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
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
              const _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
