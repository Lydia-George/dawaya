import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:dawaya/presentation/cubits/pharmacy/pharmacy_cubit.dart';
import 'package:dawaya/presentation/cubits/search/search_cubit.dart';
import 'package:dawaya/presentation/screens/home/shimmer/pharmacy_card_shimmer.dart';
import 'package:dawaya/presentation/screens/home/widgets/banner_carousel.dart';
import 'package:dawaya/presentation/screens/home/widgets/pharmacy_card.dart';
import 'package:dawaya/presentation/screens/search/widgets/search_result_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/widgets/custom_shapes/containers/primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .scaffoldBackgroundColor,
      body: Column(
        children: [

          /// -- Header
          PrimaryHeaderContainer(),

          /// -- BODY
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state.hasSearched) {
                  if (state.isLoading) {
                    return ListView.builder(
                        itemCount: 4,
                        itemBuilder: (_, __) => PharmacyCardShimmer());
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
                      return ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          itemCount: 5,
                          itemBuilder: (_, __) => const  PharmacyCardShimmer()
                    );
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
                    )
                    ,
                    ]
                    ,
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

