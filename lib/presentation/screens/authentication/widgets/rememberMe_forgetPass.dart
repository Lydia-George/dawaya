import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:dawaya/presentation/cubits/auth/auth_cubit.dart';
import 'package:dawaya/presentation/screens/authentication/forgot_and_reset_password/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RememberMeAndForgetPass extends StatelessWidget {
  const RememberMeAndForgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Row(
          children: [
            Checkbox(
              value: state.rememberMe,
              activeColor: DColors.primaryColorPest,
              onChanged: (value) {
                context.read<AuthCubit>().toggleRememberMe(value);
              },
            ),
            Text(
              DText.rememberMe,
              style: TextStyle(color: DColors.primaryColorBlue),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (f) => ForgotPassword()),
                );
              },
              child: Text(
                DText.forgotPassword,
                style: TextStyle(color: DColors.primaryColorBlue),
              ),
            ),
          ],
        );
      },
    );
  }
}
