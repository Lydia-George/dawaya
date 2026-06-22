part of 'pharmacy_cubit.dart';

class PharmacyState {
  final bool isLoading;
  final List<PharmacyModel> pharmacies;
  final String? errorMessage;

  const PharmacyState({
    this.isLoading = false,
    this.pharmacies = const [],
    this.errorMessage,
  });

  PharmacyState copyWith({
    bool? isLoading,
    List<PharmacyModel>? pharmacies,
    String? errorMessage,
  }) {
    return PharmacyState(
      isLoading: isLoading ?? false,
      pharmacies: pharmacies ?? this.pharmacies,
      errorMessage: errorMessage,
    );
  }
}
