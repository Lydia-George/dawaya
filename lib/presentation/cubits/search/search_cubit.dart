import 'package:dawaya/data/models/pharmacy/pharmacy_model.dart';
import 'package:dawaya/data/models/search/search_result_model.dart';
import 'package:dawaya/data/service/api_service/search/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _repo;

  SearchCubit(this._repo) : super(SearchState());

  Future<void> search(String query, List<PharmacyModel> pharmacies) async {
    if (query.trim().isEmpty) {
      emit(const SearchState());
      return;
    }

    emit(state.copyWith(isLoading: true, hasSearched: true));
    try {
      final results = await _repo.searchAcrossPharmacies(
        query: query,
        pharmacies: pharmacies,
      );
      emit(state.copyWith(results: results));
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Search failed. Try again'));
    }
  }

  void clearSearch(){
    emit(SearchState());
  }

}
