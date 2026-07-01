class FavoriteItemModel {
  final String productId;
  final String name;
  final String image;
  final double price;
  final String pharmacyId;
  final String pharmacyName;

  FavoriteItemModel({
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.pharmacyId,
    required this.pharmacyName,
  });

  Map<String, dynamic> toJson() => {
    'productId': productId,
    'name': name,
    'image': image,
    'price': price,
    'pharmacyId': pharmacyId,
    'pharmacyName': pharmacyName,
  };

  factory FavoriteItemModel.fromJson(Map<String, dynamic> json) {
    return FavoriteItemModel(
      productId: json['productId'],
      name: json['name'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
      pharmacyId: json['pharmacyId'],
      pharmacyName: json['pharmacyName'],
    );
  }
}
