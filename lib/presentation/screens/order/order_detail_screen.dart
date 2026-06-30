import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/data/models/order/order_model.dart';
import 'package:dawaya/presentation/screens/order/widgets/details_row.dart';
import 'package:dawaya/presentation/screens/order/widgets/order_state_and_date.dart';
import 'package:dawaya/presentation/screens/order/widgets/order_total_price.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDetailScreen extends StatelessWidget {
  final OrderModel order;

  const OrderDetailScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(title: Text('Order Details')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// -- STATUS + DATE
            OrderStateAndDate(order: order),
            SizedBox(height: DSizes.spaceBtwSections),

            /// -- ITEMS
            Text('Items', style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: DSizes.spaceBtwItems),
            ...order.items.map(
              (item) => Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: DColors.secondaryPest),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(8),
                      child: Image.network(
                        item.image,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            Icon(Icons.medication_outlined),
                      ),
                    ),
                    SizedBox(height: DSizes.spaceBtwItems),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text(
                            'Qty : ${item.quantity} ',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${(item.price * item.quantity).toStringAsFixed(2)} EGP',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: DSizes.spaceBtwSections),

            /// -- DELIVERY INFO
            Text(
              'Delivery Details',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: DSizes.spaceBtwItems),
            DetailRow(icon: CupertinoIcons.person, label: order.name),
            DetailRow(icon: CupertinoIcons.phone, label: order.phone),
            DetailRow(
              icon: CupertinoIcons.location,
              label: order.paymentMethod,
            ),
            SizedBox(height: DSizes.spaceBtwSections),

            /// -- TOTAL
            OrderTotalPrice(order: order),
          ],
        ),
      ),
    );
  }
}


