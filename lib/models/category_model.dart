class CategoryModel {
  final String slug;
  final String title;
  final double rating;
  final String imagePath;
  final String description;
  final double price;

  const CategoryModel({
    required this.slug,
    required this.title,
    required this.rating,
    required this.imagePath,
    required this.description,
    required this.price,
  });
}
