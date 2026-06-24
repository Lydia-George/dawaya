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

  const OrderModel({
    required this.id,
    required this.items,
    required this.totalPrice,
    required this.address,
    required this.phone,
    required this.name,
    required this.paymentMethod,
    required this.status,
    required this.pharmacyId,
  });

  Map<String, dynamic> toJson() {
    return {
      'items': items
          .map(
            (i) => {
              'productId': i.productId,
              'name': i.name,
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
      'createdAt': DateTime.now().toIso8601String(),
    };
  }
}
