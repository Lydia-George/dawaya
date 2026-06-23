import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/data/models/product/product_model.dart';
import 'package:dawaya/presentation/screens/pharmacy_screen/product_details_screen.dart';
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
    final price = product.priceAt(pharmacyId);
    final available = product.isAvailableAt(pharmacyId);

    return GestureDetector(
      onTap: available
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
        opacity: available ? 1.0 : 0.5,
        child: Container(
          margin: EdgeInsets.only(bottom: 12),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: DColors.pestLinear1),
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  product.image,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: DSizes.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.apply(color: DColors.blueLinear1),
                    ),
                    SizedBox(height: DSizes.spaceBtwItems),
                    Text(
                      available ? '$price EGP' : 'Not available',
                      style: Theme.of(context).textTheme.titleMedium!.apply(
                        color: available ? DColors.dGreen : DColors.dRed,
                      ),
                    ),
                  ],
                ),
              ),
              if(available) Icon(Icons.chevron_right_rounded, color: DColors.dGrey1,),
            ],
          ),
        ),
      ),
    );
  }
}
