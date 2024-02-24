import 'package:cuidapet_leia/app/modules/core/supplier/supplier_controller.dart';
import 'package:flutter/material.dart';

import 'package:cuidapet_leia/app/core/ui/extensions/theme_extension.dart';
import 'package:cuidapet_leia/app/models/supplier_model.dart';

class SupplierDetail extends StatelessWidget {
  final SupplierModel supplier;
  final SupplierController controller;

  const SupplierDetail({
    Key? key,
    required this.supplier,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: Center(
            child: Text(
              supplier.name,
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
        ListTile(
           onTap:controller.goToGeoCopyToClipat,
          leading: const Icon(
            Icons.location_city,
            color: Colors.black,
          ),
          title: Text(supplier.address),
        ),
        ListTile(
          onTap:  controller.goToPhoneCopyToClipat,
          leading: const Icon(
            Icons.phone_android,
            color: Colors.black,
          ),
          title: Text(supplier.phone),
        ),
        Divider(
          thickness: 1,
          color: context.primaryColor,
        ),
      ],
    );
  }
}
