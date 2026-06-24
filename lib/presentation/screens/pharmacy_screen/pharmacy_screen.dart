import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/data/service/api_service/product/product_repo.dart';
import 'package:dawaya/presentation/cubits/products/products_cubit.dart';
import 'package:dawaya/presentation/screens/pharmacy_screen/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PharmacyScreen extends StatelessWidget {
  final String pharmacyId;

  const PharmacyScreen({super.key, required this.pharmacyId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductsCubit(ProductRepo())..getCategories(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Categories ',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.apply(color: DColors.primaryColorBlue),
            ),
          ),
        ),
        body: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.1,
              ),
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                return CategoryGridItem(
                  category: state.categories[index],
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
