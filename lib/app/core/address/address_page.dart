import 'package:cuidapet_leia/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
part 'widgets/addres_item.dart';

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
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                child: TextFormField(
                  decoration: InputDecoration(
                      label: const Text('Inserir um endereço'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
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
