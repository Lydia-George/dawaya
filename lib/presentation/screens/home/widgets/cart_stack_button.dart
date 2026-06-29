import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../cart/cart_screen.dart';
class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    required this.itemsCount,
  });

  final int itemsCount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartScreen()),
              );
            },
            icon: Icon(CupertinoIcons.cart, size: 22),
            color: DColors.primaryColorBlue,
          ),
        ),
        if (itemsCount > 0)
          Positioned(
            top: -2,
            right: -2,
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: DColors.primaryColorBlue,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1),
              ),
              constraints: BoxConstraints(
                maxWidth: 16,
                maxHeight: 16,
              ),
              child: Text(
                '$itemsCount',
                style: TextStyle(
                  color: DColors.dWhite,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}