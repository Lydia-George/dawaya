import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnboardModel extends StatelessWidget {
 const OnboardModel({
   super.key,
    required this.title,
   required this.subTitle,
   required this.imageUrl
});


 final String title;
 final String subTitle;
 final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(DSizes.defaultSpace*2),
      child: Column(
        children: [
          Image(
            width: DHelperFunctions.screenWidth()*0.8,
            height: DHelperFunctions.screenHeight()*0.6,
            image: AssetImage(imageUrl),),

          Text(title,

          ),

          SizedBox(
            height: DSizes.spaceBtwItems,
          ),
          Text(subTitle,

          )
        ],
      ),
    );
  }



}