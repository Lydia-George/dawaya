import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../cubits/cart/cart_cubit.dart';
import '../../cart/cart_screen.dart';
import '../../main_navigation_screen.dart';
import '../../search/widgets/search_bar.dart';
class PharmacyScreenHeader extends StatelessWidget {
  const PharmacyScreenHeader({
    super.key,
  });

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

          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {

              final itemsCount = state.items.length;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// back button
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const MainNavigationScreen(),
                          ),
                              (route) => false,
                        );
                      },
                      icon: Icon(CupertinoIcons.back, size: 22),
                      color: DColors.primaryColorBlue,
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          /// cart button
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
                                  MaterialPageRoute(
                                    builder: (_) => CartScreen(),
                                  ),
                                );
                              },
                              icon: Icon(CupertinoIcons.cart, size: 22),
                              color: DColors.primaryColorBlue,
                            ),
                          ),


                        ],
                      ),

                      /// items count
                      if(itemsCount > 0)
                        Positioned(
                          top: -2,
                          right: -2,
                          child: Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              color: DColors.primaryColorBlue,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
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
                  ),
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
