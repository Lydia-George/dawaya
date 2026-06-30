import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/presentation/cubits/cart/cart_cubit.dart';
import 'package:dawaya/presentation/cubits/theme/theme_cubit.dart';
import 'package:dawaya/presentation/screens/cart/cart_screen.dart';
import 'package:dawaya/presentation/screens/home/home_screen.dart';
import 'package:dawaya/presentation/screens/order/orders_screen.dart';
import 'package:dawaya/presentation/screens/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    CartScreen(),
    OrdersScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;
    final isDarkMode =
        themeState.themeMode == AppThemeMode.dark ||
        (themeState.themeMode == AppThemeMode.system &&
            MediaQuery.platformBrightnessOf(context) == Brightness.dark);

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),

      bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() => _currentIndex = index);
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),

              BottomNavigationBarItem(
                icon: Badge(
                  backgroundColor: DColors.primaryColorBlue,
                  label: Text('${state.items.length}'),
                  isLabelVisible: state.items.isNotEmpty,
                  child: Icon(Icons.add_shopping_cart),
                ),
                label: 'Cart',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long_outlined),
              activeIcon: Icon(Icons.receipt_long),
                label: 'Orders'
              ),

              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                activeIcon: Icon(Icons.person),
                label: 'Account',
              ),
            ],
          );
        },
      ),
    );
  }
}
