import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/auth_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// -- EMAIL
        AuthField(
          labelText: DText.email,
          hintText: DText.hintEmail,
          textInputType: TextInputType.emailAddress,
          icon: Icon(Icons.email_outlined),
        ),
        SizedBox(height: DSizes.spaceBtwItems),

        /// -- PASSWORD
        AuthField(
          labelText: DText.password,
          hintText: DText.hintPassword,
          icon: Icon(Icons.lock_outlined),
          isObscure: true,
        ),
        SizedBox(height: DSizes.spaceBtwItems),

      ],
    );
  }
}
