import 'package:dawaya/data/dataSources/mockData/category/mock_categories.dart';
import 'package:dawaya/data/dataSources/mockData/products/mock_products.dart';
import 'package:dawaya/data/models/category/category_model.dart';
import 'package:dawaya/data/models/product/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsState());

  /// -- GET CATEGORIES
  Future<void> getCategories(String pharmacyId) async{
    emit(state.copyWith(isLoading: true));
    try{
      await Future.delayed(Duration(milliseconds: 400));
      // handle categories filtration according to pharmacy (With Django)
      emit(state.copyWith(categories: mockCategories));
    }catch(e){
      emit(state.copyWith(errorMessage: e.toString()));

    }

  }

  /// -- GET PRODUCTS
  Future<void> getProducts(String categoryId) async{
    emit(state.copyWith(isLoading: true));
    try{
      await Future.delayed(Duration(milliseconds: 400));
      final filtered = mockProducts.where((p) => p.categoryId == categoryId).toList();
      emit(state.copyWith(products: filtered));
    }catch(e){
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

}
