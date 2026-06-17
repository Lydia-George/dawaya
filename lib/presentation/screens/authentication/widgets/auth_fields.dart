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
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: DColors.pestLinear1
          )
        ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: DColors.blueLinear1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: DColors.primaryColorBlue),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: DColors.blueLinear2
          ),
          prefixIcon: icon,
          prefixIconColor: DColors.pestLinear1,
          labelText: labelText,
          labelStyle: TextStyle(
            color: DColors.blueLinear2
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          //  borderSide: BorderSide(color: DColors.dGrey1),
          ),


      ),
    );
  }
}