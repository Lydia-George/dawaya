import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/data/service/api_service/product/product_repo.dart';
import 'package:dawaya/presentation/cubits/cart/cart_cubit.dart';
import 'package:dawaya/presentation/cubits/products/products_cubit.dart';
import 'package:dawaya/presentation/cubits/search/search_cubit.dart';
import 'package:dawaya/presentation/screens/cart/cart_screen.dart';
import 'package:dawaya/presentation/screens/pharmacy_screen/widgets/category_grid_item.dart';
import 'package:dawaya/presentation/screens/search/widgets/search_bar.dart';
import 'package:dawaya/presentation/screens/search/widgets/search_result_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PharmacyScreen extends StatelessWidget {
  final String pharmacyId;

  const PharmacyScreen({super.key, required this.pharmacyId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductsCubit(ProductRepo())..getCategories(),
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Column(
          children: [
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
                builder: (context, searchState) {

                  /// Search Loading
                  if (searchState.hasSearched && searchState.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  /// Search Error
                  if (searchState.hasSearched &&
                      searchState.errorMessage != null) {
                    return Center(
                      child: Text(searchState.errorMessage!),
                    );
                  }

                  /// No Results
                  if (searchState.hasSearched &&
                      searchState.results.isEmpty) {
                    return Center(
                      child: Text(
                        'Oops !! No Products found',
                        style: TextStyle(
                          color: DColors.primaryColorBlue,
                        ),
                      ),
                    );
                  }

                  /// Search Results
                  if (searchState.hasSearched) {
                    return ListView.builder(
                      itemCount: searchState.results.length,
                      itemBuilder: (context, index) {
                        final item = searchState.results[index];

                        return SearchResultCard(result: searchState.results[index]);
                      },
                    );
                  }

                  /// Default Categories Screen
                  return BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (context, productState) {

                      if (productState.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'Browse Categories',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: DColors.primaryColorBlue,
                                ),
                              ),
                            ),

                            SizedBox(height: DSizes.spaceBtwItems),

                            Expanded(
                              child: GridView.builder(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 20,
                                  childAspectRatio: 0.72,
                                ),
                                itemCount: productState.categories.length,
                                itemBuilder: (context, index) {
                                  return CategoryGridItem(
                                    category: productState.categories[index],
                                    pharmacyId: pharmacyId,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
