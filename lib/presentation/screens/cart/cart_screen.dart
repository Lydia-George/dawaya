import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:dawaya/core/constants/image_strings.dart';
import 'package:dawaya/presentation/cubits/cart/cart_cubit.dart';
import 'package:dawaya/presentation/cubits/order/order_cubit.dart';
import 'package:dawaya/presentation/screens/authentication/login_screen.dart';
import 'package:dawaya/presentation/screens/authentication/signup_screen.dart';
import 'package:dawaya/presentation/screens/cart/checkout_screen.dart';
import 'package:dawaya/presentation/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen()),
            );
          },
          icon: Icon(CupertinoIcons.back, color: DColors.primaryColorBlue),
        ),
        title: Text(
          'Cart',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.apply(color: DColors.primaryColorBlue),
        ),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return Center(
              child: Column(
                children: [
                  ClipRRect(
                    child: Lottie.asset(DImageStrings.emptyCartAnimation),
                  ),
                  SizedBox(height: DSizes.spaceBtwSections),

                  Text(
                    'Your Cart is empty',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.apply(color: DColors.blueLinear1),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];

                    return Container(
                      margin: EdgeInsets.only(bottom: 12),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: DColors.pestLinear1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              item.image,
                              width: 56,
                              height: 56,
                              fit: BoxFit.cover,
                              errorBuilder: (_, _, _) =>
                                  Icon(Icons.medication_outlined, size: 40),
                            ),
                          ),

                          SizedBox(width: DSizes.spaceBtwItems),

                          /// -- product details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '${item.price} EGP',
                                  style: TextStyle(
                                    color: DColors.primaryColorBlue,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () =>
                                    context.read<CartCubit>().updateQuantity(
                                      item.productId,
                                      item.quantity - 1,
                                    ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(28, 28),
                                  backgroundColor: DColors.primaryColorBlue,
                                  foregroundColor: DColors.primaryColorPest,
                                  elevation: 0,
                                ),

                                child: Icon(
                                  Icons.remove,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),

                              Text(
                                '${item.quantity}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: DColors.primaryColorBlue,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    context.read<CartCubit>().updateQuantity(
                                      item.productId,
                                      item.quantity + 1,
                                    ),

                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(28, 28),
                                  backgroundColor: DColors.primaryColorBlue,
                                  foregroundColor: DColors.primaryColorPest,
                                  elevation: 0,
                                ),

                                child: Icon(
                                  Icons.add,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Column(
                    children: [

                    ],
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: DColors.pestLinear1,
                      blurRadius: 8,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),

                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: DColors.primaryColorBlue
                            ),
                          ),
                          Text(
                            '${state.totalPrices.toStringAsFixed(2)} EGP',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: DColors.primaryColorBlue
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: DSizes.spaceBtwItems),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (_) => BlocProvider(create:
                                    (context) => OrderCubit(),
                                  child: CheckoutScreen(),
                            )));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: DColors.primaryColorBlue,
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Text('Checkout', style: TextStyle(color: DColors.whiteTxt),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _handleCheckout(BuildContext context) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;

    if (isLoggedIn) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => CheckoutScreen()),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Sign up to continue'),
          content: Text('You need an account to complete your order.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SignUpScreen(redirectToCheckout: true),
                  ),
                );
              },
              child: Text(DText.createAccount),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                );
              },
              child: Text(DText.login),
            ),
          ],
        ),
      );
    }
  }
}
