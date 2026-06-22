import 'package:dawaya/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LogoutButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(DText.logout));
  }
}
