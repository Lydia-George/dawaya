import 'package:dawaya/presentation/screens/home/home_screen.dart';
import 'package:dawaya/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {

      return const HomeScreen();

  }
}
