import 'package:flutter/material.dart';

import '../../../../data/models/order/order_model.dart';
class OrderTotalPrice extends StatelessWidget {
  const OrderTotalPrice({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            '${order.totalPrice.toStringAsFixed(2)} EGP',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}