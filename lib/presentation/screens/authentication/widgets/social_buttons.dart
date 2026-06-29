import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/presentation/cubits/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// -- FACEBOOK BUTTON
            IconButton(
              onPressed: () {},
              icon: Image(
                width: DSizes.lg,
                height: DSizes.lg,
                image: AssetImage('lib/assets/images/png/facebook-icon.png'),
              ),
            ),

            /// -- GOOGLE BUTTON
            IconButton(
              onPressed: state.isLoading
                  ? null
                  : () => context.read<AuthCubit>().signInWithGoogle(),

              icon: Image(
                width: DSizes.lg,
                height: DSizes.lg,
                image: AssetImage('lib/assets/images/png/google-icon.png'),
              ),
            ),
          ],
        );
      },
    );
  }
}
