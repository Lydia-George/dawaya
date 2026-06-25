//
// import 'package:dawaya/core/constants/app_colors.dart';
// import 'package:dawaya/core/constants/app_sizes.dart';
// import 'package:dawaya/core/utils/device/device_utility.dart';
// import 'package:dawaya/core/utils/helpers/helper_functions.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
//
// class DAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const DAppBar(
//       {super.key,
//         this.title,
//         this.showBackArrow = false,
//         this.leadingIcon,
//         this.actions,
//         this.leadingOnPressed});
//
//   final Widget? title;
//   final bool showBackArrow;
//   final IconData? leadingIcon;
//   final List<Widget>? actions;
//   final VoidCallback? leadingOnPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     final dark = DHelperFunctions.isDarkMode(context);
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: DSizes.md),
//       child: AppBar(
//         backgroundColor: Colors.white,
//         automaticallyImplyLeading: false,
//         leading: showBackArrow
//             ? IconButton(
//             onPressed: () => Get.back(),
//             icon:  Icon(CupertinoIcons.back,
//               color: dark? DColors.primaryColorPest : DColors.primaryColorBlue,))
//             : leadingIcon != null
//             ? IconButton(
//             onPressed: leadingOnPressed,
//             icon: Icon(leadingIcon)) : null,
//         title: title,
//         actions: actions,
//       ),
//     );
//   }
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => Size.fromHeight(DDeviceUtlis.getAppBarHeight());
// }