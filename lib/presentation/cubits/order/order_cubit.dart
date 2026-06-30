import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawaya/data/models/cart/cart_item_model.dart';
import 'package:dawaya/data/models/order/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderState());

  void onNamedChanged(String value) => emit(state.copyWith(name: value));

  void onPhoneChanged(String value) => emit(state.copyWith(phone: value));

  void onAddressChanged(String value) => emit(state.copyWith(address: value));

  void onPaymentMethodChanged(String value) =>
      emit(state.copyWith(paymentMethod: value));

  Map<String, String> _validateFields() {
    final errors = <String, String>{};
    if (state.name.trim().isEmpty) errors['name'] = 'Name is required !';
    if (state.phone.trim().isEmpty) errors['phone'] = 'Phone is required !';
    if (state.address.trim().isEmpty) {
      errors['address'] = 'Address is required !';
    }
    return errors;
  }

  Future<void> validateAndSubmit({
    required List<CartItemModel> items,
    required double totalPrice,
    required String pharmacyId,
    required String pharmacyName,
  }) async {
    final errors = _validateFields();
    if (errors.isNotEmpty) {
      emit(state.copyWith(fieldErrors: errors));
      return;
    }

    emit(state.copyWith(isLoading: true, fieldErrors: {}));

    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        emit(
          state.copyWith(
            errorMessage: 'You must be signed in to place an order',
          ),
        );
        return;
      }

      final order = OrderModel(
        id: '',
        items: items,
        totalPrice: totalPrice,
        address: state.address,
        phone: state.phone,
        name: state.name,
        paymentMethod: state.paymentMethod,
        status: 'pending',
        pharmacyId: pharmacyId,
        pharmacyName: pharmacyName,
        createdAt: DateTime.now(),
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('orders')
          .add(order.toJson());

      emit(state.copyWith(isSuccess: true));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void resetForm() {
    emit(OrderState());
  }
}
