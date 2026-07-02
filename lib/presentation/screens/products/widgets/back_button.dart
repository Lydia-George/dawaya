import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../cubits/cart/cart_cubit.dart';
import '../../cart/cart_screen.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      left: 16,
      right: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: DColors.dGery2,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: DColors.primaryColorBlue,
                size: 18,
              ),
            ),
          ),

          /// -- CART BUTTON
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              final itemsCount = state.items.length;
              return CircleAvatar(
                backgroundColor: DColors.dGery2,
                child: Badge(
                  backgroundColor: DColors.primaryColorBlue,
                  label: Text('$itemsCount'),
                  isLabelVisible: itemsCount > 0,
                  child: IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    color: DColors.primaryColorBlue,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CartScreen(),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
