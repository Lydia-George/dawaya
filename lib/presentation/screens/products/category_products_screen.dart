import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/data/service/api_service/product/product_repo.dart';
import 'package:dawaya/presentation/cubits/products/products_cubit.dart';
import 'package:dawaya/presentation/screens/products/shimmer/product_grid_shimmer.dart';
import 'package:dawaya/presentation/screens/products/widgets/product_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryName;
  final String pharmacyId;
  final String pharmacyName;

  const CategoryProductsScreen({
    super.key,
    required this.categoryId,
    required this.categoryName,
    required this.pharmacyId,
     this.pharmacyName ='',
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (_) =>
          ProductsCubit(ProductRepo())
            ..getProducts(pharmacyId: pharmacyId, categoryId: categoryId),
      child: Scaffold(
        backgroundColor: isDark ? DColors.dBlack : DColors.dGery2,
        appBar: AppBar(
          backgroundColor: isDark ? DColors.dBlack : DColors.dGery2,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
              color: isDark
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
          title: Text(categoryName),
        ),
        body: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return ProductGridShimmer();
            }
            if (state.errorMessage != null) {
              return Center(child: Text(state.errorMessage!));
            }
            if (state.products.isEmpty) {
              return Center(
                child: Text('Oops ! No Products in this category!'),
              );
            }
            return GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.62,
              ),

              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return ProductListItem(
                  product: state.products[index],
                  pharmacyId: pharmacyId,
                  pharmacyName: pharmacyName ,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
