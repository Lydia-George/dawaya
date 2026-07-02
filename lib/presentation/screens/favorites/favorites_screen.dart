import 'package:dawaya/core/constants/image_strings.dart';
import 'package:dawaya/data/models/favouriteItem/favorite_item_model.dart';
import 'package:dawaya/data/models/product/product_model.dart';
import 'package:dawaya/presentation/cubits/favorite/favorite_cubit.dart';
import 'package:dawaya/presentation/screens/favorites/widgets/favorite_product.dart';
import 'package:dawaya/presentation/screens/products/product_details_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Favorites')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Lottie.asset(DImageStrings.loginAnimation)),
            Text('Sign in to save and see your favorite products'),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return Center(child: Text('No Favorites yet'));
          }

          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              final item = state.items[index];
              return FavoriteProduct(item: item);
            },
          );
        },
      ),
    );
  }
}


