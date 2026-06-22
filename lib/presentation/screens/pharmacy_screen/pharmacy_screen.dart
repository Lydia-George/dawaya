import 'package:flutter/material.dart';
class PharmacyScreen extends StatelessWidget {
  final String pharmacyId;
  const PharmacyScreen({super.key, required this.pharmacyId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shop $pharmacyId'),),
      body: Center(child: Text('Coming Soon'),),

    );
  }
}
