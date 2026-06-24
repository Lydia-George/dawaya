
class PharmacyModel {
  final String id;
  final String name;
  final String logo;
  final String address;
  final String phone;
  final bool isActive;

  PharmacyModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.address,
    required this.phone,
    required this.isActive,
  });

  factory PharmacyModel.fromJson(Map<String, dynamic> json) {
    return PharmacyModel(
      id: json['id'].toString(),
      name: json['name']?.toString() ?? '',
      logo: json['logo']?.toString() ?? '',
      address: json['address']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      isActive: json['isOpen'] ?? true,
    );
  }
}
