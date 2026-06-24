
class PharmacyModel {
  final String id;
  final String name;
  final String logo;
  final String address;
  final double rating;
  final String deliveryTime;
  final bool isOpen;

  PharmacyModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.address,
    required this.rating,
    required this.deliveryTime,
    required this.isOpen,
  });

  factory PharmacyModel.fromJson(Map<String, dynamic> json) {
    return PharmacyModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      logo: json['logo'] ?? '',
      address: json['address'] ?? '',
      rating: (json['rating']as num? )?.toDouble() ?? 0.0,
      deliveryTime: json['deliveryTime']?.toString() ?? 'N/A',
      isOpen: json['isOpen'] ?? true,
    );
  }
}
