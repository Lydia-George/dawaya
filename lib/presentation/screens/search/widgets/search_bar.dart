import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/presentation/cubits/pharmacy/pharmacy_cubit.dart';
import 'package:dawaya/presentation/cubits/search/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(
                color: DColors.blueLinear2
              ),
              controller: _controller,
              onChanged: (value) {
                setState(() {

                });
                final pharmacies = context.read<PharmacyCubit>().state.pharmacies;
                context.read<SearchCubit>().search(value, pharmacies);
              },

              decoration: InputDecoration(

                hintText: 'Search for products',
                hintStyle: TextStyle(color: DColors.blueLinear1),
                prefixIcon: Icon(Icons.search, color: DColors.blueLinear2,),
                prefixStyle: TextStyle(color: DColors.primaryColorBlue),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.close, color: DColors.blueLinear2,),
                        onPressed: () {
                          _controller.clear();
                          context.read<SearchCubit>().clearSearch();
                          setState(() {});
                        },
                      )
                    : null,

                filled: true,
                fillColor: DColors.dWhite,
                border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: DColors.primaryColorBlue),
                ),
                focusedBorder: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: DColors.secondaryPest),
                ),
                disabledBorder: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: DColors.primaryColorBlue),
                ),
                enabledBorder: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: DColors.dWhite),
                ),

              ),
              onTap: () => setState(() {}),
            ),
          ),
        ],
      ),
    );
  }
}
