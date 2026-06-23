import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:dawaya/presentation/cubits/auth/auth_cubit.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/auth_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// -- FULL NAME
        AuthField(
          labelText: DText.fullName,
          hintText: DText.fullNameHint,
          textInputType: TextInputType.name,
          icon: Icon(CupertinoIcons.person),
          onChanged: (value) =>
              context.read<AuthCubit>().onFullNameChanged(value),
        ),
        SizedBox(height: DSizes.spaceBtwInputFields),

        /// -- EMAIL
        AuthField(
          labelText: DText.email,
          hintText: DText.hintEmail,
          textInputType: TextInputType.emailAddress,
          icon: Icon(Icons.email_outlined),
          onChanged: (value) => context.read<AuthCubit>().onEmailChanged(value),
        ),
        SizedBox(height: DSizes.spaceBtwItems),

        /// -- PASSWORD
        AuthField(
          labelText: DText.password,
          hintText: DText.hintPassword,
          icon: Icon(Icons.lock_outlined),
          isObscure: true,
          onChanged: (value) =>
              context.read<AuthCubit>().onPasswordChanged(value),
        ),
        SizedBox(height: DSizes.spaceBtwItems),

        /// -- CONFIRM PASSWORD
        AuthField(
          labelText: 'Confirm Password',
          hintText: DText.confirmPasswordHint,
          icon: Icon(Icons.lock_outlined),
          isObscure: true,
          onChanged: (value) =>
              context.read<AuthCubit>().onConfirmPasswordChanged(value),
        ),
        SizedBox(height: DSizes.spaceBtwItems),
      ],
    );
  }
}
