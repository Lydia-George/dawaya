import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:dawaya/core/constants/image_strings.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/auth_button.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/auth_fields.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
            /// SIGN UP TXT
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                DText.login,
                style: TextStyle(
                  color: DColors.blackTxt,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            
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
        ),
      ),
    );
  }
}
