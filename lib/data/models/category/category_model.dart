class CategoryModel {
  final String id;
  final String name;
  final String image;
  final String color;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.color,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'].toString(),
      name: json['name'],
      image: json['image'],
      color: json['color'],
    );
  }
}
