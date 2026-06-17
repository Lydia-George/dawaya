import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:dawaya/core/constants/image_strings.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/align_titles.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/auth_button.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/auth_fields.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/orSignup_in_line.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/social_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              ),
              // SizedBox(height: DSizes.spaceBtwSections,),

              /// -- SIGNUP TITLE
              AlignTitleSubTitle(
                titleTxt: DText.signupTitle,
                textSize: DSizes.fontSizeMd,
              ),
              // SizedBox(height: DSizes.spaceBtwSections,),

              /// -- SIGNUP SUBTITLE
              AlignTitleSubTitle(
                titleTxt: DText.signupSubTitle,
                textSize: DSizes.fontSizeSm,
                textColor: DColors.blueLinear1.withOpacity(0.6),
              ),
              SizedBox(height: DSizes.spaceBtwSections),

              /// -- FULL NAME
              AuthField(
                labelText: DText.fullName,
                hintText: DText.fullNameHint,
                textInputType: TextInputType.name,
                icon: Icon(CupertinoIcons.person),
              ),
              SizedBox(height: DSizes.spaceBtwInputFields),

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

              /// -- CONFIRM PASSWORD
              AuthField(
                labelText: 'Confirm Password',
                hintText: DText.confirmPasswordHint,
                icon: Icon(Icons.lock_outlined),
                isObscure: true,
              ),
              SizedBox(height: DSizes.spaceBtwItems),

              /// -- SIGNUP BUTTON
              AuthButtons(btnText: DText.signUp),
              SizedBox(height: DSizes.spaceBtwItems),

              /// -- OR SIGNUP WITH DIVIDER
              OrSignUpInLine(),

              /// -- SOCIAL BUTTONS
              SocialButtons(),




            ],
          ),
        ),
      ),
    );
  }
}
