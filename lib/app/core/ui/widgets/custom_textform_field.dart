import 'package:cuidapet_leia/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class CustomTextformField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextVn;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  CustomTextformField({Key? key, 
    
    required this.label,
    this.obscureText = false,
    this.controller,
    this.validator,
  }) : _obscureTextVn = ValueNotifier<bool>(obscureText), super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextVn,
      builder: (_, obscureTextVnValue, child) {
        return TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureTextVnValue,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            suffixIcon: obscureText
                ? IconButton(
                    onPressed: () {
                      _obscureTextVn.value = !obscureTextVnValue;
                    },
                    icon: Icon(
                      obscureTextVnValue ? Icons.lock : Icons.lock_open,
                      color: context.primaryColor,
                    ))
                : null,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(color: Colors.grey)),
          ),
        );
      },
    );
  }
}
