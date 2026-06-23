import 'package:dawaya/presentation/cubits/products/products_cubit.dart';
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
    return BlocProvider(create: (_) => ProductsCubit()..getProducts(categoryId),
    child: Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state){
        if(state.isLoading){
          return Center(child: CircularProgressIndicator(

          ),);
        }
        if(state.products.isEmpty){
          return Center(
            child: Text('Oops ! No Products in this category!'),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.all(16),
            itemCount: state.products.length,
            itemBuilder: (context , index){
            }
        );

          }),
    ),
    );
  }
}
