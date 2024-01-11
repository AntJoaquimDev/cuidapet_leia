import 'package:cuidapet_leia/app/models/place_model.dart';
import 'package:cuidapet_leia/app/modules/address/widgets/address_search_widget/address_search_controller.dart';
import 'package:flutter/material.dart';

import 'package:cuidapet_leia/app/core/ui/extensions/theme_extension.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';


part 'widgets/addres_item.dart';
part 'widgets/address_search_widget/address_search_widget.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.primaryColor),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              Text(
                'Adicione ou escolha um endereço',
                style: context.textTheme.headlineMedium
                    ?.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 20),
          //    _AddressSearchWidget(addressSelectedCallback: addressSelectedCallback, place: place),
              
              const SizedBox(height: 20),
              const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 30,
                  child: Icon(
                    Icons.near_me,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  'Localização atual.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              const SizedBox(height: 20),
              const Column(
                children: [
                  _AddresItem(),
                  _AddresItem(),
                  _AddresItem(),
                  _AddresItem(),
                  _AddresItem(),
                  _AddresItem(),
                  _AddresItem(),
               
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
