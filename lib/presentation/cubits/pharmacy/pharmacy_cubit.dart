import 'package:dawaya/data/dataSources/mockData/pharmacies/mock_pharmacies.dart';
import 'package:dawaya/data/models/pharmacy/pharmacy_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pharmacy_state.dart';

class PharmacyCubit extends Cubit<PharmacyState> {
  PharmacyCubit() : super(const PharmacyState());

  Future<void> getPharmacies() async {
    emit(state.copyWith(isLoading: true));
    try {
      await Future.delayed(Duration(milliseconds: 500));
      emit(state.copyWith(pharmacies: mockPharmacies));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }
}
