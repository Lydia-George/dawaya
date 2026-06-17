import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {


   SocialButtons({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        /// -- FACEBOOK BUTTON
        IconButton(

          onPressed: () {},
          icon: Image(
            width: DSizes.lg,
            height: DSizes.lg,
            image: AssetImage(
              'lib/assets/images/png/facebook-icon.png'
            ),
          ),
        ),

        /// -- GOOGLE BUTTON
        IconButton(
            onPressed: (){},

            icon: Image(
                width: DSizes.lg,
                height: DSizes.lg,
                image: AssetImage('lib/assets/images/png/google-icon.png'),
            )),

      ],
    );
  }
}