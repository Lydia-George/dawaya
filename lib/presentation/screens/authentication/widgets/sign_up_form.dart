import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/auth_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const SignUpForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.fullNameController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// -- FULL NAME
        AuthField(
          controller: fullNameController,
          labelText: DText.fullName,
          hintText: DText.fullNameHint,
          textInputType: TextInputType.name,
          icon: Icon(CupertinoIcons.person),
        ),
        SizedBox(height: DSizes.spaceBtwInputFields),

        /// -- EMAIL
        AuthField(
          controller: emailController,
          labelText: DText.email,
          hintText: DText.hintEmail,
          textInputType: TextInputType.emailAddress,
          icon: Icon(Icons.email_outlined),
        ),
        SizedBox(height: DSizes.spaceBtwItems),

        /// -- PASSWORD
        AuthField(
          controller: passwordController,
          labelText: DText.password,
          hintText: DText.hintPassword,
          icon: Icon(Icons.lock_outlined),
          isObscure: true,
        ),
        SizedBox(height: DSizes.spaceBtwItems),

        /// -- CONFIRM PASSWORD
        AuthField(
          controller: confirmPasswordController,
          labelText: 'Confirm Password',
          hintText: DText.confirmPasswordHint,
          icon: Icon(Icons.lock_outlined),
          isObscure: true,
        ),
        SizedBox(height: DSizes.spaceBtwItems),
      ],
    );
  }
}
