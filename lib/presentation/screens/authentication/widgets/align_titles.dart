import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:flutter/cupertino.dart';

class AlignTitleSubTitle extends StatelessWidget {

  String titleTxt;
  double textSize;
  Color? textColor;

   AlignTitleSubTitle({
    super.key,
     required this.titleTxt,
     required this.textSize,
     this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        titleTxt,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: textSize,
        ),
      ),
    );
  }
}
