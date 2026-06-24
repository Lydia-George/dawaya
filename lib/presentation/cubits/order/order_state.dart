part of 'order_cubit.dart';

 class OrderState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final Map<String, String> fieldErrors;
  final String name;
  final String phone;
  final String address;
  final String paymentMethod;

  const OrderState({
   this.isLoading = false,
   this.isSuccess = false,
   this.errorMessage,
   this.fieldErrors = const{},
   this.name ='',
   this.phone = '',
   this.address = '',
   this.paymentMethod = 'Cash on Delivery',
 });


  OrderState copyWith({
   bool? isLoading,
   bool? isSuccess,
   String? errorMessage,
   Map<String, String>? fieldErrors,
   String? name,
   String? phone,
   String? address,
   String? paymentMethod,
 }){
   return OrderState(
    isLoading: isLoading ?? false,
    isSuccess: isSuccess ?? false,
    errorMessage: errorMessage,
    fieldErrors: fieldErrors ?? this.fieldErrors,
    name: name ?? this.name,
    phone: phone ?? this.phone,
    address: this.address,
    paymentMethod: paymentMethod ?? this.paymentMethod,
   );
  }


 }

