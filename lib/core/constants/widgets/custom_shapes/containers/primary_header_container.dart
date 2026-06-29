import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../presentation/cubits/cart/cart_cubit.dart';
import '../../../../../presentation/screens/cart/cart_screen.dart';
import '../../../../../presentation/screens/home/widgets/cart_stack_button.dart';
import '../../../../../presentation/screens/home/widgets/theme_toggle_button.dart';
import '../../../../../presentation/screens/search/widgets/search_bar.dart';
import '../../../app_colors.dart';
import '../../../app_sizes.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DColors.primaryColorBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),

      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 12,
        bottom: 16,
        left: 16,
        right: 16,
      ),
      child: Column(
        children: [
          /// -- cart
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              final itemsCount = state.items.length;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// -- SWITCH BETWEEN DARK&LIGHT MODE
                  ThemeToggleButton(),

                  /// CART STACK BUTTON
                  CartButton(itemsCount: itemsCount),
                ],
              );
            },
          ),

          SizedBox(height: DSizes.spaceBtwSections),

          SearchBarWidget(),
          SizedBox(height: DSizes.spaceBtwSections),
        ],
      ),
    );
  }
}


