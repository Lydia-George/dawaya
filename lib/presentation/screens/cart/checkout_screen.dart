import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/presentation/cubits/cart/cart_cubit.dart';
import 'package:dawaya/presentation/cubits/order/order_cubit.dart';
import 'package:dawaya/presentation/screens/cart/widgets/order_text_field.dart';
import 'package:dawaya/presentation/screens/order/order_success_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state.isSuccess) {
          context.read<CartCubit>().clearCart();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const OrderSuccessScreen()),
          );
        }
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: DColors.whiteTxt,
        appBar: AppBar(
          backgroundColor: DColors.whiteTxt,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: DColors.whiteTxt,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  CupertinoIcons.back,
                  color: DColors.primaryColorBlue,
                ),
                iconSize: 18,
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Checkout',
                style: Theme.of(context).textTheme.headlineMedium!.apply(
                  color: DColors.primaryColorBlue,
                ),
              ),

              /// -- ADDRESS
              BlocBuilder<OrderCubit, OrderState>(
                builder: (context, state) {
                  return Text(
                    state.address,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: DColors.dGrey1, fontSize: 12),
                  );
                },
              ),
            ],
          ),
        ),
        body: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            final cartState = context.watch<CartCubit>().state;
            final subTotal = cartState.totalPrices;
            const deliveryFees = 25.0;
            final totalAmount = subTotal + deliveryFees;

            return Padding(
              padding: const EdgeInsets.all(DSizes.defaultSpace),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// -- DELIVERY DATA TEXT FIELDS
                          OrderTextField(
                            keyboardType: TextInputType.name,
                            hintText: 'Enter you fullname',
                            prefixIcon: Icon(Icons.person_outline),
                            labelText: 'Full Name',
                            errorText: state.fieldErrors['name'],
                            onChanged: (value) =>
                                context.read<OrderCubit>().onNamedChanged(value),
                          ),
                          SizedBox(height: DSizes.spaceBtwItems),
                          OrderTextField(
                            keyboardType: TextInputType.phone,
                            hintText: 'Enter your phone number',
                            prefixIcon: Icon(CupertinoIcons.phone),
                            labelText: 'Phone Number',
                            errorText: state.fieldErrors['phone'],
                            onChanged: (value) =>
                                context.read<OrderCubit>().onPhoneChanged(value),
                          ),
                          SizedBox(height: DSizes.spaceBtwItems),
                          OrderTextField(
                            keyboardType: TextInputType.streetAddress,
                            hintText: 'Enter your Address',
                            prefixIcon: Icon(Icons.person_pin_circle_outlined),
                            labelText: 'Delivery Address',
                            maxLines: 2,
                            errorText: state.fieldErrors['address'],
                            onChanged: (value) =>
                                context.read<OrderCubit>().onAddressChanged(value),
                          ),

                          SizedBox(height: DSizes.spaceBtwSections),

                          /// -- PAYMENT METHODS
                          Text(
                            'Pay with',
                            style: Theme.of(context).textTheme.headlineMedium!
                                .apply(color: DColors.primaryColorBlue),
                          ),
                          SizedBox(height: DSizes.spaceBtwItems),

                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: DColors.dGrey1),
                            ),
                            child: Column(
                              children: [
                                _buildPaymentOptionRow(
                                  context: context,
                                  title: 'Apple Pay',
                                  icon: Icons.apple,
                                  value: 'Apple Pay',
                                  groupValue: state.paymentMethod,
                                ),
                                Divider(height: 1, color: DColors.dGery2),
                                _buildPaymentOptionRow(
                                  context: context,
                                  title: 'Cash',
                                  icon: Icons.money,
                                  value: 'Cash on Delivery',
                                  groupValue: state.paymentMethod,
                                ),
                                _buildSecurityBadge(),
                                SizedBox(height: DSizes.spaceBtwSections),
                              ],
                            ),
                          ),
                          SizedBox(height: DSizes.spaceBtwSections),

                          /// -- VOUCHER
                          Text(
                            'Save on your order',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: DColors.primaryColorBlue,
                            ),
                          ),
                          SizedBox(height: DSizes.spaceBtwItems),
                          _buildVoucherField(),
                          SizedBox(height: DSizes.spaceBtwSections),

                          Text(
                            'Payment Summary',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: DColors.primaryColorBlue,
                            ),
                          ),
                          SizedBox(height: DSizes.spaceBtwItems),
                          _buildSummaryRow(
                            'Subtotal',
                            'EGP ${subTotal.toStringAsFixed(2)}',
                          ),
                          SizedBox(height: DSizes.spaceBtwItems),
                          _buildSummaryRow(
                            'Delivery fee',
                            'EGP ${deliveryFees.toStringAsFixed(2)}',
                            hasInfo: true,
                          ),
                          SizedBox(height: DSizes.spaceBtwItems),
                          _buildSummaryRow(
                            'Total amount',
                            'EGP ${totalAmount.toStringAsFixed(2)}',
                            isTotal: true,
                          ),

                          /// -- PLACE ORDER BUTTON
                          _buildBottomCheckoutButton(
                            context,
                            state,
                            cartState,
                            totalAmount,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPaymentOptionRow({
    required BuildContext context,
    required String title,
    required IconData icon,
    required String value,
    required String groupValue,
  }) {
    final isSelected = value == groupValue;

    return ElevatedButton(
      onPressed: () => context.read<OrderCubit>().onPaymentMethodChanged(value),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: DColors.primaryColorBlue,
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      child: Row(
        children: [
          Icon(icon, size: 22, color: DColors.primaryColorBlue),
          SizedBox(width: DSizes.spaceBtwItems),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: DColors.primaryColorBlue,
            ),
          ),
          Spacer(),
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? DColors.primaryColorBlue : DColors.dGrey1,
                width: isSelected ? 6 : 2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: const BoxDecoration(
        color: DColors.dGery2,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.gpp_good_outlined,
            size: 18,
            color: DColors.primaryColorBlue,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Protected by PCI Data Security Standard',
              style: TextStyle(
                fontSize: 12,
                color: DColors.primaryColorBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(Icons.info_outline, size: 18, color: Colors.blue.shade700),
        ],
      ),
    );
  }

  Widget _buildVoucherField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.local_offer_outlined, color: DColors.primaryColorBlue),
          const SizedBox(width: 12),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter voucher code',
                hintStyle: TextStyle(color: DColors.dGrey1),
                border: InputBorder.none,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Submit',
              style: TextStyle(
                color: DColors.primaryColorBlue,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value, {
    bool isTotal = false,
    bool hasInfo = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: isTotal ? 16 : 14,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.w400,
                color: isTotal ? DColors.primaryColorBlue : DColors.dGrey1,
              ),
            ),
            if (hasInfo) ...[
              const SizedBox(width: 4),
              Icon(Icons.info_outline, size: 14, color: DColors.dGrey1),
            ],
          ],
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: FontWeight.bold,
            color: DColors.primaryColorBlue,
          ),
        ),
      ],
    );
  }

  /// -- لاحظي: مفيش BlocConsumer هنا خالص، الزرار بيستخدم نفس state
  /// اللي جاية من الـ BlocBuilder الخارجي في body. مفيش shadowing تاني.
  Widget _buildBottomCheckoutButton(
    BuildContext context,
    OrderState state,
    dynamic cartState,
    double totalAmount,
  ) {
    final isFormFilled = state.name.trim().isNotEmpty &&
        state.phone.trim().isNotEmpty &&
        state.address.trim().isNotEmpty;

    String buttonText = 'Place Order';
    if (state.paymentMethod == 'Apple Pay') {
      buttonText = 'Pay with Apple Pay';
    } else if (state.paymentMethod == 'Cash on Delivery') {
      buttonText = 'Confirm Cash Order';
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          onPressed: (!isFormFilled || state.isLoading)
              ? null
              : () {
                  if (cartState.pharmacyId == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Pharmacy ID is missing')),
                    );
                    return;
                  }
                  context.read<OrderCubit>().validateAndSubmit(
                    items: cartState.items,
                    totalPrice: totalAmount,
                    pharmacyId: cartState.pharmacyId!,
                  );
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: DColors.primaryColorBlue,
            disabledBackgroundColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 0,
          ),
          child: state.isLoading
              ? const CircularProgressIndicator(color: Colors.blue)
              : Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}