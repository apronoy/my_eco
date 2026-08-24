class CategoryModel {
  final String slug;
  final String title;
  final String imagePath;
  final String description;
  final double price;

  const CategoryModel({
    required this.slug,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.price,
  });
}