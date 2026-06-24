class ProductModel {
  final String id;
  final String name;
  final String categoryId;
  final String categoryName;
  final String description;
  final String image;
  final double price;
  final int stock;
  final bool isAvailable;

  const ProductModel({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.description,
    required this.image,
    required this.price,
    required this.isAvailable,
    required this.categoryName,
    required this.stock,
  });

  bool get canOrder => isAvailable && stock > 0;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['product_id'].toString(),
      name: json['product_name']?.toString() ?? '',
      categoryId: json['category_id'].toString(),
      categoryName: json['category_name']?.toString() ?? '',
      description: json['product_description']?.toString() ?? '',
      image: json['product_image']?.toString() ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      stock: json['stock'] ?? 0,
      isAvailable: json['is_available'] ?? true,
    );
  }
}
