class ProductModel {
  final String id;
  final String name;
  final String categoryId;
  final String description;
  final String image;
  final Map<String, double> prices;
  final Map<String, bool> availability;

  const ProductModel({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.description,
    required this.image,
    required this.prices,
    required this.availability,
  });

  double priceAt(String pharmacyId) => prices[pharmacyId] ?? 0.0;

  bool isAvailableAt(String pharmacyId) => availability[pharmacyId] ?? false;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      name: json['name'],
      categoryId: json['category'].toString(),
      description: json['description'] ?? '',
      image: json['image'],
      prices: Map<String, double>.from(
        json['prices'] as Map,
      ).map((k, v) => MapEntry(k, (v as num).toDouble())),
      availability: Map<String, bool>.from(json['availability'] ?? {}),
    );
  }
}
