part of 'products_cubit.dart';

class ProductsState {
  final bool isLoading;
  final List<CategoryModel> categories;
  final List<ProductModel> products;
  final String? errorMessage;

  const ProductsState({
     this.isLoading =false,
     this.categories =const [],
     this.products = const[] ,
    this.errorMessage,
  });


  ProductsState copyWith({
    bool? isLoading,
    List<CategoryModel>? categories,
    List<ProductModel>? products,
    String? errorMessage,
  }) {
    return ProductsState(isLoading: isLoading ?? false,
        categories: categories ?? this.categories,
        products: products ?? this.products,
      errorMessage: errorMessage,
    );
  }


}
