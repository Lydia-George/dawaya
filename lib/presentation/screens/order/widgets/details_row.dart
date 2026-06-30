import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';

class DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;

  const DetailRow({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: DSizes.spaceBtwItems),
          Expanded(child: Text(label)),
        ],
      ),
    );
  }
}