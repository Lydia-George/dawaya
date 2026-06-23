import 'package:dawaya/data/models/product/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  final String pharmacyId;

  const ProductDetailsScreen({
    super.key,
    required this.product,
    required this.pharmacyId,
  });

  @override
  Widget build(BuildContext context) {
    final price = product.priceAt(pharmacyId);

    return Scaffold();
  }
}
