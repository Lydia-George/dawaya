import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:dawaya/presentation/cubits/cart/cart_cubit.dart';
import 'package:dawaya/presentation/cubits/pharmacy/pharmacy_cubit.dart';
import 'package:dawaya/presentation/cubits/search/search_cubit.dart';
import 'package:dawaya/presentation/screens/cart/cart_screen.dart';
import 'package:dawaya/presentation/screens/home/widgets/banner_carousel.dart';
import 'package:dawaya/presentation/screens/home/widgets/pharmacy_card.dart';
import 'package:dawaya/presentation/screens/search/widgets/search_bar.dart';
import 'package:dawaya/presentation/screens/search/widgets/search_result_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /// -- Header
          Container(
            decoration: BoxDecoration(
              color: DColors.primaryColorBlue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),

            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 12,
              bottom: 16,
              left: 16,
              right: 16,
            ),
            child: Column(
              children: [
                /// -- cart
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    final itemsCount = state.items.length;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => CartScreen(),
                                    ),
                                  );
                                },
                                icon: Icon(CupertinoIcons.cart, size: 22),
                                color: DColors.primaryColorBlue,
                              ),
                            ),
                            if(itemsCount > 0)
                            Positioned(
                              top: -2,
                              right: -2,
                              child: Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: DColors.primaryColorBlue,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                ),
                                constraints: BoxConstraints(
                                  maxWidth: 16,
                                  maxHeight: 16,
                                ),
                                child: Text(
                                  '$itemsCount',
                                  style: TextStyle(
                                    color: DColors.whiteTxt,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),

                SizedBox(height: DSizes.spaceBtwSections),

                SearchBarWidget(),
                SizedBox(height: DSizes.spaceBtwSections),
              ],
            ),
          ),

          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state.hasSearched) {
                  if (state.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state.errorMessage != null) {
                    return Center(child: Text(state.errorMessage!));
                  }
                  if (state.results.isEmpty) {
                    return Center(
                      child: Text(
                        'Oops !! No Products found',
                        style: TextStyle(color: DColors.primaryColorBlue),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: state.results.length,
                    itemBuilder: (context, index) {
                      return SearchResultCard(result: state.results[index]);
                    },
                  );
                }

                return BlocBuilder<PharmacyCubit, PharmacyState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state.errorMessage != null) {
                      return Center(child: Text(state.errorMessage!));
                    }

                    return ListView(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      children: [
                        /// -- BANNERS
                        BannerCarousel(),
                        SizedBox(height: DSizes.spaceBtwItems),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            DText.pharmaciesNearYou,
                            style: Theme.of(context).textTheme.titleMedium!
                                .apply(color: DColors.primaryColorBlue),
                          ),
                        ),
                        SizedBox(height: DSizes.spaceBtwItems),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          itemCount: state.pharmacies.length,
                          itemBuilder: (context, index) {
                            return PharmacyCard(
                              pharmacy: state.pharmacies[index],
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
