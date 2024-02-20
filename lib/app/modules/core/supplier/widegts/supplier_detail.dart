import 'package:flutter/material.dart';
import 'package:cuidapet_leia/app/core/ui/extensions/theme_extension.dart';

class SupplierDetail extends StatelessWidget {
  const SupplierDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: Center(
            child: Text(
              'Clinica Pulga Morta',
              style: context.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Divider(
          thickness: 1,
          color: context.primaryColor,
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            'Informações do estabelecimento',
            style: context.textTheme.titleSmall,
            textAlign: TextAlign.start,
          ),
        ),
        const ListTile(
          leading: Icon(
            Icons.location_city,
            color: Colors.black,
          ),
          title: Text('Av. Livio de Carvalho 200'),
        ),
        const ListTile(
          leading: Icon(
            Icons.phone_android,
            color: Colors.black,
          ),
          title: Text('86994687689'),
        ),
        Divider(
          thickness: 1,
          color: context.primaryColor,
        ),
      
      ],
    );
  }
}
