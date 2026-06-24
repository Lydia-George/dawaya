import 'package:dawaya/data/dataSources/mockData/category/mock_categories.dart';
import 'package:dawaya/data/dataSources/mockData/products/mock_products.dart';
import 'package:dawaya/data/models/category/category_model.dart';
import 'package:dawaya/data/models/product/product_model.dart';
import 'package:dawaya/data/service/api_service/product/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepo _repo;

  ProductsCubit(this._repo) : super(ProductsState());

  /// -- GET CATEGORIES
  Future<void> getCategories() async {
    emit(state.copyWith(isLoading: true));
    try {
      final categories = await _repo.getCategories();

      // handle categories filtration according to pharmacy (With Django)
      emit(state.copyWith(categories: categories));
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to load categories !!'));
    }
  }

  /// -- GET PRODUCTS
  Future<void> getProducts({
    required String pharmacyId,
    required String categoryId,
  }) async {
    emit(state.copyWith(isLoading: true));

    try {
      final products = await _repo.getPharmacyProductsByCategory(
        pharmacyId: pharmacyId,
        categoryId: categoryId,
      );
      emit(state.copyWith(products: products));
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to load products'));
    }
  }
}
