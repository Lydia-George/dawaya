import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/presentation/screens/main_navigation_screen.dart';
import 'package:flutter/material.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(DSizes.defaultSpace),
          child: Column(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: DColors.dGreen,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle,
                  size: 60,
                  color: DColors.successColor,
                ),
              ),

              SizedBox(height: DSizes.spaceBtwSections),
              Text(
                'Order Placed Successfully!',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.apply(color: DColors.dGrey1),
              ),
              SizedBox(height: DSizes.spaceBtwItems),
              Text(
                'Estimated deliver time : 30-45 min',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.apply(color: DColors.dGrey1),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: DSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => MainNavigationScreen()),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text('Back to Home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
