import 'package:dawaya/presentation/cubits/pharmacy/pharmacy_cubit.dart';
import 'package:dawaya/presentation/screens/home/widgets/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: BlocBuilder<PharmacyCubit, PharmacyState>(
          builder: (context, state){
            if(state.isLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state.errorMessage != null){
              return Center(child: Text(state.errorMessage!),);
            }

            return ListView(
              padding: EdgeInsets.symmetric(vertical: 16),
              children: [

                /// -- BANNERS
                BannerCarousel(),



              ],
            );


      })),

    );
  }
}
