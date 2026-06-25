import 'package:dawaya/presentation/screens/main_navigation_screen.dart';
import 'package:dawaya/presentation/screens/onboarding/onboarding_screen.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _hasSeenOnboarding(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        final hasSeenOnboarding = snapshot.data ?? false;

        if (hasSeenOnboarding) {
          return MainNavigationScreen();
        }
        return OnboardingScreen();
      },
    );
  }

  Future<bool> _hasSeenOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('has_seen_onboarding') ?? false;
  }
}
