import 'package:cuidapet_leia/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class SupplierServiceWidget extends StatefulWidget {


  const SupplierServiceWidget({super.key});

  @override
  State<SupplierServiceWidget> createState() => _SupplierServiceWidgetState();
}

class _SupplierServiceWidgetState extends State<SupplierServiceWidget> {
  
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
