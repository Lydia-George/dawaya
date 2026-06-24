class ProductModel {
  final String id;
  final String name;
  final String categoryId;
  final String description;
  final String image;
  final double price;
  final bool isAvailable;

  const ProductModel({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.description,
    required this.image,
    required this.price,
    required this.isAvailable,
  });

  //double priceAt(String pharmacyId) => prices[pharmacyId] ?? 0.0;

  // bool isAvailableAt(String pharmacyId) => isAvailable[pharmacyId] ?? false;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      categoryId: json['category']?.toString() ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] as num? )?.toDouble() ?? 0.0,
      isAvailable: (json['isAvailable'] ?? true),
    );
  }
}
