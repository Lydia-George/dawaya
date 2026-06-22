import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:dawaya/core/constants/image_strings.dart';
import 'package:dawaya/presentation/cubits/auth/auth_cubit.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/align_titles.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/already_have_account.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/auth_button.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/orSignup_in_line.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/sign_up_form.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/social_buttons.dart';
import 'package:dawaya/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fullNameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpace),
          child: Column(
            children: [
              /// -- IMAGE
              Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage(DImageStrings.signUpImage),
                  height: MediaQuery.of(context).size.height * 0.30,
                ),
              ),
              SizedBox(height: 25),

              /// -- SIGNUP TXT
              AlignTitleSubTitle(
                titleTxt: DText.signUp,
                textSize: DSizes.fontSizeLg,
                textColor: DColors.blueLinear2,
              ),
              // SizedBox(height: DSizes.spaceBtwSections,),

              /// -- SIGNUP TITLE
              AlignTitleSubTitle(
                titleTxt: DText.signupTitle,
                textSize: DSizes.fontSizeMd,
                textColor: DColors.blueLinear1,
              ),
              // SizedBox(height: DSizes.spaceBtwSections,),

              /// -- SIGNUP SUBTITLE
              AlignTitleSubTitle(
                titleTxt: DText.signupSubTitle,
                textSize: DSizes.fontSizeSm,
                textColor: DColors.pestLinear1,
              ),

              SizedBox(height: DSizes.spaceBtwSections),

              /// -- Form Fields
              SignUpForm(
                fullNameController: fullNameController,
                emailController: emailController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
              ),

              /// -- SIGNUP BUTTON
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state.isSuccess) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (h) => HomeScreen()),
                    );
                  }
                  if (state.errorMessage != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage!)),
                    );
                  }
                },
                builder: (context, state) {
                  return AuthButtons(
                    btnText: DText.signUp,
                    onPressed: () {
                      state.isLoading
                          ? null
                          : () {
                              if (passwordController.text !=
                                  confirmPasswordController.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Password do not match !!'),
                                  ),
                                );
                                return;
                              }
                              context.read<AuthCubit>().register(
                                emailController.text,
                                passwordController.text,
                              );
                            };
                    },
                  );
                },
              ),
              SizedBox(height: DSizes.spaceBtwItems),

              /// -- OR CONTINUE WITH DIVIDER
              OrSignUpInLine(),

              /// -- SOCIAL BUTTONS
              SocialButtons(),

              /// -- ALREADY HAVE ACCOUNT
              AlreadyHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
