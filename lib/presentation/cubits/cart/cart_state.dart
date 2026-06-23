part of 'cart_cubit.dart';

 class CartState {
   final String? pharmacyId;
   final List<CartItemModel> items;

  const CartState({
    this.pharmacyId,
    this.items= const[],
 });

  double get totalPrices => items.fold(0.0, (sum,item) => sum + item.totalPrice);

  CartState copyWith({
    String? pharmacyId,
    List<CartItemModel>? items,}
      ){
    return CartState(
      pharmacyId: pharmacyId ?? this.pharmacyId,
      items: items ?? this.items,
    );
  }


 }


