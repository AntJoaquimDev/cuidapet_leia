import 'package:cuidapet_leia/app/core/life_cycle/page_life_cicle_state.dart';
import 'package:cuidapet_leia/app/core/ui/extensions/size_screen_extension.dart';
import 'package:cuidapet_leia/app/entities/address_entity.dart';
import 'package:cuidapet_leia/app/modules/core/home/home_controller.dart';
import 'package:cuidapet_leia/app/services/address/address_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends PageLifeCycleState<HomeController, HomePage> {
  AddressEntity? addressEntity;

  @override
  Map<String, dynamic>? get params => {'testes': 'testes params'};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 162.w,
              height: 130.h,
              fit: BoxFit.contain,
            ),
          ),
          TextButton(
              onPressed: () async {
                // final categorieResponse =
                //     await Modular.get<RestClient>().auth().get('/categories/');
              },
              child: const Text('Teste Refresh_Token')),
          TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text('Logout')),
          TextButton(
              onPressed: () async {
                await Modular.to.pushNamed('/address/');
              },
              child: const Text('Ir para Endereço.')),
          TextButton(
              onPressed: () async {
                final address =
                    await Modular.get<AddressService>().getAddressSelected();
               setState(() {
                  addressEntity = address;
               });
              },
              child: const Text('Busrcar Endereço.')),

              Text(addressEntity?.address ?? 'Nenhum endereço selecionado'),
              Center(child: Text(addressEntity?.additional ?? 'Nenhum complemento selecionado')),
        ],
      ),
    );
  }
}
