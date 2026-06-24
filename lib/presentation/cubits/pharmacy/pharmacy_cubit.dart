import 'package:dawaya/data/dataSources/mockData/pharmacies/mock_pharmacies.dart';
import 'package:dawaya/data/models/pharmacy/pharmacy_model.dart';
import 'package:dawaya/data/service/api_service/pharmacy/pharmacy_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pharmacy_state.dart';

class PharmacyCubit extends Cubit<PharmacyState> {
  final PharmacyRepo _repo;

  PharmacyCubit(this._repo) : super(const PharmacyState());

  Future<void> getPharmacies() async {
    emit(state.copyWith(isLoading: true));
    try {
      final pharmacies = await _repo.getPharmacies();
      emit(state.copyWith(pharmacies: pharmacies));
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage:
              'Failed to load pharmacies. Check Your Internet connection',
        ),
      );
    }
  }
}
