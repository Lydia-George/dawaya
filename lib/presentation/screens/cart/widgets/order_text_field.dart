import 'package:dawaya/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class OrderTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String? errorText;
  final Icon prefixIcon;
  final Function(String)? onChanged;
  final int? maxLines;
  final TextInputType keyboardType;


  const OrderTextField({
    super.key,
    required this.labelText,
    required this.errorText,
    this.onChanged,
    this.maxLines,
    required this.prefixIcon, required this.hintText,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(

      textInputAction: TextInputAction.next,

      style: TextStyle(
        color: DColors.primaryColorBlue
      ),

      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: DColors.whiteTxt,
        hintText: hintText ,
        hintStyle: TextStyle(color: DColors.blueLinear2),
        labelText: labelText,
        labelStyle: TextStyle(color: DColors.blueLinear1),
        prefixIcon: prefixIcon,
        prefixIconColor: DColors.primaryColorBlue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: DColors.primaryColorBlue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: DColors.primaryColorBlue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: DColors.primaryColorPest),
        ),
        errorText: errorText,
        errorStyle: TextStyle(color: DColors.dRed),
      ),
    );
  }
}
