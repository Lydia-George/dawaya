import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/data/models/product/product_model.dart';
import 'package:dawaya/data/models/search/search_result_model.dart';
import 'package:dawaya/presentation/screens/products/product_details_screen.dart';
import 'package:flutter/material.dart';

class SearchResultCard extends StatelessWidget {
  final SearchResultModel result;

  const SearchResultCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final product = ProductModel(
          id: result.productId,
          name: result.pharmacyName,
          categoryId: '',
          description: '',
          image: result.image,
          price: result.price,
          isAvailable: result.isAvailable,
          categoryName: '',
          stock: result.isAvailable ? 1 : 0,
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(
              product: product,
              pharmacyId: result.pharmacyId,
              pharmacyName: result.pharmacyName,
            ),
          ),
        );
      },

      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: DColors.pestLinear1),
          borderRadius: BorderRadius.circular(16),
        ),

        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: Image.network(
                result.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Icon(
                  Icons.medication_outlined,
                  color: DColors.primaryColorBlue,
                  size: 36,
                ),
              ),
            ),


            SizedBox(width: 12,),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(result.productName, style: TextStyle(fontWeight: FontWeight.w600,
                color: DColors.primaryColorBlue

                ),),
                SizedBox(height: DSizes.spaceBtwItems,),
                Text('at ${result.pharmacyName}', style: TextStyle(
                  fontSize: 12, color: DColors.dGrey1,),
                ),
              ],
            )),

            Text(result.isAvailable ?' ${result.price.toStringAsFixed(0)}EGP' : 'Not available',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: result.isAvailable ? DColors.successColor : DColors.errorColor,
            ),
            )
          ],
        ),
      ),
    );
  }
}
