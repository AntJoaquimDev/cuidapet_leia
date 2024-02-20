import 'package:cuidapet_leia/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class SupplierServiceWidget extends StatelessWidget {
  const SupplierServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:const CircleAvatar(
        child: Icon(Icons.pets),
      ),
      title: const Text('Banho completo'),
      subtitle:const Text(r'R$50,00'),
      trailing: Icon(
        Icons.add_circle,
        size: 30,
        color: context.primaryColor,
      ),
    );
  }
}
