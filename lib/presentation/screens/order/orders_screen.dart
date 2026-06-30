import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/data/models/order/order_model.dart';
import 'package:dawaya/presentation/screens/main_navigation_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import 'order_detail_screen.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text('My Orders'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MainNavigationScreen()),
              );
            },
            icon: Icon(CupertinoIcons.back),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Lottie.asset('lib/assets/lottie/Login & Mobile Login.json'),
              SizedBox(height: DSizes.spaceBtwSections),
              Text('Log In to see your orders '),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(title: Text('My Orders')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('orders')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Column(
                children: [
                  Lottie.asset('lib/assets/lottie/NO RECENT ORDERS.json'),
                  SizedBox(height: DSizes.spaceBtwSections),
                  Text('No recent orders'),
                  Text(
                    'When you place your order , it will appear here',
                    style: TextStyle(color: DColors.dGrey1, fontSize: 16),
                  ),
                ],
              ),
            );
          }
          final orders = snapshot.data!.docs
              .map(
                (doc) => OrderModel.fromFirestore(
                  doc.id,
                  doc.data() as Map<String, dynamic>,
                ),
              )
              .toList();

          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OrderDetailScreen(order: order),
                    ),
                  );
                },

                child: Container(
                  margin: EdgeInsets.only(bottom: 12),
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            order.pharmacyName,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          _StatusBadge(status: order.status),
                        ],
                      ),
                      SizedBox(height: DSizes.spaceBtwItems),
                      Text(
                        DateFormat(
                          'MMM d, yyyy • h:mm a',
                        ).format(order.createdAt),
                        style: Theme.of(context).textTheme.labelSmall,
                      ),

                      SizedBox(height: DSizes.spaceBtwItems),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${order.items.length} items${order.items.length > 1 ? 's' : ''}',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          Text(
                            '${order.totalPrice.toStringAsFixed(2)} EGP',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;

  const _StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (status) {
      case 'delivered':
        color = DColors.successColor;
        break;
      case 'pending':
        color = DColors.yellowLinear2;
        break;
      default:
        color = DColors.primaryColorBlue;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Text(
        status.toUpperCase() + status.substring(1),
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
