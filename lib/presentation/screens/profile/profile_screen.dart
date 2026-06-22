import 'package:dawaya/presentation/cubits/auth/auth_cubit.dart';
import 'package:dawaya/presentation/screens/authentication/widgets/auth_gate.dart';
import 'package:dawaya/presentation/screens/profile/widgets/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [





            /// LOGOUT BUTTON
            LogoutButton(
              onPressed: () {
                context.read<AuthCubit>().logout();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => AuthGate()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
