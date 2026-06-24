import 'package:dawaya/data/service/api_service/product/product_repo.dart';
import 'package:dawaya/presentation/cubits/products/products_cubit.dart';
import 'package:dawaya/presentation/screens/pharmacy_screen/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryName;
  final String pharmacyId;

  const CategoryProductsScreen({
    super.key,
    required this.categoryId,
    required this.categoryName,
    required this.pharmacyId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ProductsCubit(ProductRepo())
            ..getProducts(pharmacyId: pharmacyId, categoryId: categoryId),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text(categoryName)),
        body: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(child: CircularProgressIndicator());
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
                );
              },
            );
          },
        ),
      ),
    );
  }
}
