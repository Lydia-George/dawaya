import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/data/models/pharmacy/pharmacy_model.dart';
import 'package:dawaya/presentation/screens/pharmacy_screen/pharmacy_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PharmacyCard extends StatelessWidget {
  final PharmacyModel pharmacy;

  const PharmacyCard({super.key, required this.pharmacy});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PharmacyScreen(pharmacyId: pharmacy.id),
          ),
        );
      },

      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: DColors.pestLinear1),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Image.asset(
                pharmacy.logo,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: DSizes.spaceBtwItems),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pharmacy.name,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.apply(color: DColors.blueLinear1),
                  ),
                  SizedBox(height: DSizes.xs),
                  Text(
                    pharmacy.address,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.apply(color: DColors.dGrey1),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: DSizes.s),
                  Row(
                    children: [
                      Icon(
                        Icons.star_outlined,
                        size: DSizes.iconXs,
                        color: DColors.dYellow,
                      ),
                      SizedBox(width: DSizes.xs),
                      Text(
                        '${pharmacy.rating}',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      SizedBox(width: DSizes.md),
                      Icon(
                        CupertinoIcons.timer,
                        size: DSizes.iconXs,
                        color: DColors.dGrey1,
                      ),
                      Text(
                        pharmacy.deliveryTime,
                        style: Theme.of(
                          context,
                        ).textTheme.labelSmall!.apply(color: DColors.dGrey1),
                      ),
                    ],
                  ),
                  if (!pharmacy.isOpen)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Closed',
                        style: Theme.of(
                          context,
                        ).textTheme.labelSmall!.apply(color: DColors.dRed),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
