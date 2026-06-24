import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/presentation/cubits/order/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String? errorText;
  final Icon prefixIcon;
  final Function(String)? onChanged;
  final int? maxLines;

  const OrderTextField({
    super.key,
    required this.labelText,
    required this.errorText,
    this.onChanged,
    this.maxLines,
    required this.prefixIcon, required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(

      style: TextStyle(
        color: DColors.primaryColorBlue
      ),
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText ,
        hintStyle: TextStyle(color: DColors.blueLinear2),
        labelText: labelText,
        labelStyle: TextStyle(color: DColors.blueLinear1),
        prefixIcon: prefixIcon,
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
