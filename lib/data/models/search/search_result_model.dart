class SearchResultModel {
  final String productId;
  final String productName;
  final String image;
  final double price;
  final bool isAvailable;
  final String pharmacyId;
  final String pharmacyName;

  const SearchResultModel({
    required this.productId,
    required this.productName,
    required this.image,
    required this.price,
    required this.isAvailable,
    required this.pharmacyId,
    required this.pharmacyName,
  });
}