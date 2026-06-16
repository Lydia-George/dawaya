import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthField extends StatelessWidget {

  final String labelText;
  final String hintText;
  TextInputType? textInputType;
  Icon icon;
  bool isObscure;

   AuthField({
    super.key,
    required this.labelText,
    required this.hintText,
     this.textInputType,
     required this.icon,
     this.isObscure=false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:textInputType,
      obscureText: isObscure,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: DColors.dGrey1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: DColors.primaryColorBlue),
          ),
          hintText: hintText,
          prefixIcon: icon,
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          //  borderSide: BorderSide(color: DColors.dGrey1),
          ),


      ),
    );
  }
}