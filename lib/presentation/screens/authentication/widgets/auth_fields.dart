import 'package:dawaya/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {


  final String labelText;
  final String hintText;
  final TextInputType? textInputType;
  final Icon icon;
  final bool isObscure;
  final ValueChanged<String> onChanged;


  const  AuthField({
    super.key,
    required this.labelText,
    required this.hintText,
     this.textInputType,
     required this.icon,
     this.isObscure=false,
    required this.onChanged,

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged ,
      keyboardType:textInputType,
      obscureText: isObscure,
      style: TextStyle(
        color: DColors.primaryColorBlue
      ),
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
            color: DColors.dGrey1
          ),
          prefixIcon: icon,
          prefixIconColor: DColors.dGrey1,
          labelText: labelText,
          labelStyle: TextStyle(
            color: DColors.blueLinear1
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          //  borderSide: BorderSide(color: DColors.dGrey1),
          ),



      ),
    );
  }
}