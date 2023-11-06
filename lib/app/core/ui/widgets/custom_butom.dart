import 'package:cuidapet_leia/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class CustomButom extends StatelessWidget {
  final VoidCallback? onPressed;
  final double borderRadius;
  final Color? color;
  final Color? labelColor;
  final double? labelSize;
  final String label;
  final double padding;
  final double width;
  final double height;
  const CustomButom({Key? key, 
    
    required this.onPressed,
    this.borderRadius = 10,
    this.color,
    this.labelColor,
    this.labelSize = 20,
    required this.label,
    this.padding = 10,
    this.width = double.infinity,
    this.height = 66,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          backgroundColor: color ?? context.primaryColor,
        ),
        child: Text(label,
            style: TextStyle(
              fontSize: labelSize,
              color: labelColor ?? Colors.white,
            )),
      ),
    );
  }
}
