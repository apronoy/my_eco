import 'package:flutter/foundation.dart';

import '../models/category_model.dart';

class ShopProvider extends ChangeNotifier {
  final List<CategoryModel> _categories = const [
    CategoryModel(
      slug: 'womens-handbags',
      title: "Diamond ring",
      price: 500,
      imagePath: 'assets/images/diamon_ring1.jpg',
      description: 'Explore refined handbags and everyday icons.',
    ),
    CategoryModel(
      slug: 'womens-accessories',
      title: "Diamond ring",
      price: 500.0,
      imagePath: 'assets/images/diamon_ring2.png',
      description: 'Silk accessories and finishing touches.',
    ),
    CategoryModel(
      slug: 'pouches',
      title: 'Parker Pen',
      price: 500.0,
      imagePath: 'assets/images/parker.jpg',
      description: 'Compact pieces designed for effortless organization.',
    ),
    CategoryModel(
      slug: 'sandals',
      title: 'Women’s Shoes',
      price: 500.0,
      imagePath: 'assets/images/accessories.jpg',
      description: 'Elegant footwear for a polished look.',
    ),
    CategoryModel(
      slug: 'pouches',
      title: 'Omega 370',
      price: 500.0,
      imagePath: 'assets/images/omega.jpg',
      description: 'Compact pieces designed for effortless organization.',
    ),
    CategoryModel(
      slug: 'sandals',
      title: 'Women’s Penden',
      price: 500.0,
      imagePath: 'assets/images/penden1.jpg',
      description: 'Elegant Penden for a polished look.',
    ),
    CategoryModel(
      slug: 'sandals',
      title: 'Women’s Exclusive',
      price: 500.0,
      imagePath: 'assets/images/penden2.jpg',
      description: 'Elegant Penden for a polished look.',
    ),
  ];

  List<CategoryModel> get categories => List.unmodifiable(_categories);

  CategoryModel? findCategory(String slug) {
    for (final category in _categories) {
      if (category.slug == slug) return category;
    }
    return null;
  }
}
