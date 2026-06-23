import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:dawaya/core/constants/image_strings.dart';
import 'package:dawaya/presentation/cubits/auth/auth_cubit.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/auth_button.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/auth_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
          padding: EdgeInsets.all(DSizes.defaultSpace),
          child: Column(
            children: [
              /// -- IMAGE
              Image(image: AssetImage(DImageStrings.resetPassword)),
              Spacer(),

              /// -- TITLE
              Text(
                DText.resetPassword,
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge!.apply(color: DColors.blackTxt),
              ),
              Spacer(),

              /// -- NEW PASSWORD
              AuthField(
                labelText: DText.newPassword,
                hintText: DText.newPasswordHint,
                icon: Icon(CupertinoIcons.lock),
                isObscure: true,
                onChanged: (value) => context.read<AuthCubit>().onPasswordChanged(value),
              ),
              Spacer(),

              /// -- CONFIRM PASSWORD
              AuthField(
                labelText: DText.confirmPassword,
                hintText: DText.confirmPasswordHint,
                icon: Icon(CupertinoIcons.lock),
                isObscure: true,
                onChanged: (value) => context.read<AuthCubit>().onConfirmPasswordChanged(value),
              ),
              Spacer(),

              /// -- RESET BUTTON
              AuthButtons(btnText: DText.reset, onPressed: (){}),
              Spacer(),
            ],
          ),
        ),

    );
  }
}
