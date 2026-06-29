import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/data/service/api_service/product/product_repo.dart';
import 'package:dawaya/presentation/cubits/products/products_cubit.dart';
import 'package:dawaya/presentation/cubits/search/search_cubit.dart';
import 'package:dawaya/presentation/screens/pharmacy/shimmer/category_grid_shimmer.dart';
import 'package:dawaya/presentation/screens/pharmacy/widgets/category_grid_item.dart';
import 'package:dawaya/presentation/screens/pharmacy/widgets/pharmacy_screen_header.dart';
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        body: Column(
          children: [
            /// -- HEADER
            PharmacyScreenHeader(),

            /// -- BODY
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, searchState) {

                  /// Search Loading
                  if (searchState.hasSearched && searchState.isLoading) {
                    return CategoryGridShimmer();
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
                        return const CategoryGridShimmer();
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

