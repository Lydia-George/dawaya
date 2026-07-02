import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:dawaya/core/constants/image_strings.dart';
import 'package:dawaya/presentation/cubits/auth/auth_cubit.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/align_titles.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/auth_button.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/dont_have_acc.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/login_form.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/orSignup_in_line.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/rememberMe_forgetPass.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/social_buttons.dart';
import 'package:dawaya/presentation/screens/cart/checkout_screen.dart';
import 'package:dawaya/presentation/screens/home/home_screen.dart';
import 'package:dawaya/presentation/screens/main_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final bool redirectToCheckout;


  const LoginScreen({super.key, this.redirectToCheckout = false});

  @override
  Widget build(BuildContext context) {

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.isSuccess) {
          if (redirectToCheckout) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => CheckoutScreen()),
            );
          }else{
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => MainNavigationScreen()),
            );
          }
        }
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
      },
  child: Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpace),
          child: Column(
            children: [
              /// --IMAGE
              Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage(DImageStrings.loginImage),
                  height: MediaQuery.of(context).size.height * 0.30,
                ),
              ),
              SizedBox(height: 25),

              /// SIGN In TXT
              AlignTitleSubTitle(
                titleTxt: DText.signIn,
                textSize: DSizes.fontSizeLg,
                textColor: DColors.blueLinear2,
              ),

              /// -- SIGN IN TITLE
              AlignTitleSubTitle(
                titleTxt: DText.loginTitle,
                textSize: DSizes.fontSizeMd,
                textColor: DColors.blueLinear1,
              ),

              /// -- SIGN IN SUB-TITLE
              AlignTitleSubTitle(
                titleTxt: DText.loginSubTitle,
                textSize: DSizes.fontSizeSm,
                textColor: DColors.pestLinear1,
              ),
              SizedBox(height: DSizes.spaceBtwSections),

              /// -- LOGIN FORM
              LoginForm(),

              /// -- REMEMBER ME & FORGOT PASS
              RememberMeAndForgetPass(),
              SizedBox(height: DSizes.spaceBtwItems),

              /// -- SIGN IN BUTTON
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return AuthButtons(
                    btnText: DText.signIn,

                    onPressed: state.isLoading
                        ? null
                        : () => context.read<AuthCubit>().login(),
                  );
                },
              ),
              SizedBox(height: DSizes.spaceBtwItems),

              /// -- OR CONTINUE WITH
              OrSignUpInLine(),
              SizedBox(height: DSizes.spaceBtwItems),

              /// -- SOCIAL BUTTONS
              SocialButtons(),

              /// -- DON'T HAVE ACCOUNT
              DontHaveAcc(),
            ],
          ),
        ),
      ),
    ),
);
  }
}
