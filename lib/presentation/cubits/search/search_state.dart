part of 'search_cubit.dart';

class SearchState {
  final bool isLoading;
  final List<SearchResultModel> results;
  final String? errorMessage;
  final bool hasSearched;

  const SearchState({
    this.isLoading = false,
    this.results = const [],
    this.errorMessage,
    this.hasSearched = false,
  });

  SearchState copyWith({
    bool? isLoading,
    List<SearchResultModel>? results,
    String? errorMessage,
    bool? hasSearched,
  }) {
    return SearchState(
      isLoading: isLoading ?? false,
      results: results ?? this.results,
      errorMessage: errorMessage,
      hasSearched: hasSearched ?? this.hasSearched,
    );
  }
}
