// import 'package:dawaya/core/constants/app_strings.dart';
// import 'package:dawaya/presentation/cubits/auth/auth_cubit.dart';
// import 'package:dawaya/presentation/screens/authentication/signup_screen.dart';
// import 'package:dawaya/presentation/screens/cart/checkout_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class CheckoutButton extends StatelessWidget {
//   const CheckoutButton({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         final isLoggedIn = context.read<AuthCubit>().isLoggedIn;
//
//         if (isLoggedIn) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => CheckoutScreen()),
//           );
//         } else {
//           // Ask to create account
//           showDialog(
//             context: context,
//             builder: (_) => AlertDialog(
//               title: Text(DText.signupToContinue),
//               content: Text(DText.youNeedAccount),
//               actions: [
//                 TextButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: Text(DText.skip),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => SignUpScreen(redirectToCheckout: true),
//                       ),
//                     );
//                   },
//                   child: Text(DText.createAccount),
//                 ),
//               ],
//             ),
//           );
//         }
//       },
//       child: Text(DText.dCheckout),
//     );
//   }
// }
