import 'package:dawaya/data/models/cart/cart_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState());

  bool addItem({required String pharmacyId, required CartItemModel item}) {
    if (state.pharmacyId == null || state.pharmacyId == pharmacyId) {
      final existingIndex = state.items.indexWhere(
        (i) => i.productId == item.productId,
      );
      final updatedItems = List<CartItemModel>.from(state.items);

      if (existingIndex != -1) {
        updatedItems[existingIndex].quantity += item.quantity;
      } else {
        updatedItems.add(item);
      }
      emit(state.copyWith(pharmacyId: pharmacyId, items: updatedItems));
      return true;
    }
    return false;
  }

  void clearAndAddItem({
    required String pharmacyId,
    required CartItemModel item,
  }) {
    emit(CartState(pharmacyId: pharmacyId, items: [item]));
  }

  void removeItem(String productId) {
    final updatedItems = state.items
        .where((i) => i.productId != productId)
        .toList();
    emit(
      state.copyWith(
        items: updatedItems,
        pharmacyId: updatedItems.isEmpty ? null : state.pharmacyId,
      ),
    );
  }

  void updateQuantity(String productId, int quantity) {
    if (quantity <= 0) {
      removeItem(productId);
      return;
    }
    final updatedItems = state.items.map((i) {
      if (i.productId == productId) {
        i.quantity = quantity;
      }
      return i;
    }).toList();
    emit(state.copyWith(items: updatedItems));
  }
}
