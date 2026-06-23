import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:dawaya/core/constants/image_strings.dart';
import 'package:dawaya/presentation/cubits/auth/auth_cubit.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/auth_button.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/auth_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(DSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// -- IMAGE
            Image(image: AssetImage(DImageStrings.forgetPassword)),

            /// -- TITLE
            Text(
              DText.forgotPasswordTitle,
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.apply(color: DColors.blackTxt),
            ),
            Spacer(),

            /// -- SUB-TITLE
            Text(
              DText.forgetPasswordSubTitle,
              style: Theme.of(
                context,
              ).textTheme.titleSmall!.apply(color: DColors.dGrey1),
            ),
            Spacer(),

            AuthField(
              labelText: DText.email,
              hintText: DText.hintEmail,
              icon: Icon(Icons.email_outlined),
              onChanged: (value) => context.read<AuthCubit>().onEmailChanged(value),
            ),
            Spacer(),

            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state.isPasswordResetSent) {
                  context.read<AuthCubit>().resetForm();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(DText.resetPasswordTitle)),
                  );
                  Navigator.pop(context);
                }
                if (state.errorMessage!=null) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
                }
              },
              builder: (context, state) {
                return AuthButtons(
                  btnText: DText.submit,
                  onPressed: state.isLoading
                    ? null
                    : () => context.read<AuthCubit>().resetPassword()
                );
              },
            ),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
