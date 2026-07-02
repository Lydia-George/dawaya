import 'package:dawaya/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextInputType? textInputType;
  final Icon icon;
  final bool isObscure;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;

  const AuthField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.textInputType,
    required this.icon,
    this.isObscure = false,
    required this.onChanged,
    this.validator,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator ?? (value){
        if(value == null || value.trim().isEmpty){
          return '${widget.labelText} is required';
        }
        return null;
      },
      onChanged: widget.onChanged,
      keyboardType: widget.textInputType,
      obscureText: widget.isObscure ? _obscureText : false,
      style: TextStyle(color: DColors.primaryColorBlue),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: DColors.pestLinear1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: DColors.blueLinear1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: DColors.primaryColorBlue),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: DColors.dGrey1),
        prefixIcon: widget.icon,
        prefixIconColor: DColors.dGrey1,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: DColors.blueLinear1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          //  borderSide: BorderSide(color: DColors.dGrey1),
        ),

        suffixIcon: widget.isObscure
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: DColors.dGrey1,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
