import 'dart:convert';

import 'package:dawaya/data/models/category/category_model.dart';
import 'package:dawaya/data/models/product/product_model.dart';
import 'package:dio/dio.dart';

class ProductRepo {
  final Dio _dio = Dio();
  static const String baseUrl =
      'https://DawayaFinalProject.pythonanywhere.com/api';

  /// -- GET ALL CATEGORIES
  Future<List<CategoryModel>> getCategories() async {
    final response = await _dio.get('$baseUrl/categories/');
    return (response.data as List)
        .map((json) => CategoryModel.fromJson(json))
        .toList();
  }

  /// -- GET PHARMACY PRODUCTS
  Future<List<ProductModel>> getPharmacyProducts(String pharmacyId) async {
    final response = await _dio.get(
      '$baseUrl/pharmacies/$pharmacyId/products/',
    );
    return (response.data as List)
        .map((json) => ProductModel.fromJson(json))
        .toList();
  }

  /// -- GET PHARMACY PRODUCTS BY CATEGORY
  Future<List<ProductModel>> getPharmacyProductsByCategory({
    required String pharmacyId,
    required String categoryId,
  }) async {
    final response = await _dio.get(
      '$baseUrl/pharmacies/$pharmacyId/products/ ',
      queryParameters: {'category_id': categoryId},
    );
    return (response.data as List).map((json) => ProductModel.fromJson(json)).toList();
  }
}
