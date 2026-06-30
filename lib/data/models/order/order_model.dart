import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawaya/data/models/cart/cart_item_model.dart';

class OrderModel {
  final String id;
  final List<CartItemModel> items;
  final double totalPrice;
  final String address;
  final String phone;
  final String name;
  final String paymentMethod;
  final String status;
  final String pharmacyId;
  final String pharmacyName;
  final DateTime createdAt;

  const OrderModel({
    required this.id,
    required this.items,
    required this.totalPrice,
    required this.address,
    required this.phone,
    required this.name,
    required this.paymentMethod,
    required this.status,
    required this.pharmacyName,
    required this.createdAt,
    required this.pharmacyId,
  });

  Map<String, dynamic> toJson() {
    return {
      'items': items
          .map(
            (i) => {
              'productId': i.productId,
              'name': i.name,
              'image': i.image,
              'quantity': i.quantity,
              'price': i.price,
            },
          )
          .toList(),
      'totalPrice': totalPrice,
      'address': address,
      'phone': phone,
      'name': name,
      'paymentMethod': paymentMethod,
      'status': status,
      'pharmacyId': pharmacyId,
      'pharmacyName': pharmacyName,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  factory OrderModel.fromFirestore(String id, Map<String, dynamic> json) {
    return OrderModel(
      id: id,
      items: (json['items'] as List)
          .map(
            (i) => CartItemModel(
              productId: i['productId'],
              name: i['name'],
              image: i['image'] ?? '',
              price: (i['price'] as num).toDouble(),
              quantity: i['quantity'] ?? 1,
            ),
          )
          .toList(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      address: json['address'] ?? '',
      phone: json['phone'] ?? '',
      name: json['name'] ?? '',
      paymentMethod: json['paymentMethod'],
      status: json['status'] ?? 'pending',
      pharmacyId: json['pharmacyId'] ?? '',
      pharmacyName: json['pharmacyName'] ?? '',
      createdAt: (json['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}
