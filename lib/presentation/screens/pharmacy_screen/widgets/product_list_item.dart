import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/data/models/product/product_model.dart';
import 'package:dawaya/presentation/screens/products/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  final ProductModel product;
  final String pharmacyId;

  const ProductListItem({
    super.key,
    required this.product,
    required this.pharmacyId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: product.isAvailable
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailsScreen(
                    product: product,
                    pharmacyId: pharmacyId,
                  ),
                ),
              );
            }
          : null,

      child: Opacity(
        opacity: product.isAvailable ? 1.0 : 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: DColors.dGery2,
                      borderRadius: BorderRadiusGeometry.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          product.image,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) =>
                              Icon(Icons.medication_outlined, size: 40),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.add,
                        color: DColors.primaryColorBlue,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: DSizes.spaceBtwItems),

            /// -- PRODUCT NAME
            Text(
              product.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: DColors.blueLinear1,
                height: 1.2,
              ),
            ),

            SizedBox(height: 4),

            /// -- PRICE
            Text(
              product.isAvailable ? 'EGP ${product.price} ' : 'Not available',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: product.isAvailable
                    ? DColors.primaryColorBlue
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
