import 'package:cuidapet_leia/app/core/ui/extensions/theme_extension.dart';
import 'package:cuidapet_leia/app/core/ui/extensions/size_screen_extension.dart';
import 'package:flutter/material.dart';

class CustonOrSeparator extends StatelessWidget {
  const CustonOrSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
          thickness: 1,
          color: context.primaryColor,
        )),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'ou',
            style: TextStyle(
              color: context.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
        ),
        Expanded(
            child: Divider(
          thickness: 1,
          color: context.primaryColor,
        )),
      ],
    );
  }
}
