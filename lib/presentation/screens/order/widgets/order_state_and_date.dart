import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../data/models/order/order_model.dart';

class OrderStateAndDate extends StatelessWidget {
  const OrderStateAndDate({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(order.pharmacyName,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: DSizes.spaceBtwItems/2,),
          Text(DateFormat('MMM d, yyyy • h:mm a').format(order.createdAt),
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(height: DSizes.spaceBtwItems,),
          Text('Status : ${order.status[0].toUpperCase()}${order.status.substring(1)}',
            style: Theme.of(context).textTheme.titleSmall,
          )

        ],
      ),
    );
  }
}