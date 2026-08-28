import 'dart:async';
import 'package:flutter/material.dart';
import '../models/category_model.dart';

class ShopProvider extends ChangeNotifier {
  Timer? _timer;
  Duration _remaining = const Duration(days: 10, hours: 23, minutes: 51);

  Duration get remaining => _remaining;
  int get days => _remaining.inDays;
  int get hours => _remaining.inHours % 24;
  int get minutes => _remaining.inMinutes % 60;
  int get seconds => _remaining.inSeconds % 60;

  void startCountdown() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remaining.inSeconds <= 0) {
        _timer?.cancel();
        return;
      }

      _remaining -= const Duration(seconds: 1);
      notifyListeners();
    });
  }

  void stopCountdown() {
    _timer?.cancel();
    _timer = null;
  }

  final Map<String, bool> _expandedDescriptions = {};

  bool isDescriptionExpanded(String slug) {
    return _expandedDescriptions[slug] ?? false;
  }

  void toggleDescription(String slug) {
    _expandedDescriptions[slug] = !(_expandedDescriptions[slug] ?? false);
    notifyListeners();
  }

  final List<CategoryModel> _categories = const [
    CategoryModel(
      slug: 'womens-handbags',
      title: "Red Diamond ring",
      price: 500,
      rating: 5,
      imagePath: 'assets/images/diamon_ring1.jpg',
      description:
          'Handcrafted in 18k white gold, featuring a brilliant cut rare red diamond surrounded by micro-pave accent stones. Perfect for timeless elegance.',
    ),
    CategoryModel(
      slug: 'womens-accessories',
      title: "Blue Diamond ring",
      price: 450.0,
      rating: 4,
      imagePath: 'assets/images/diamon_ring2.png',
      description:
          'An exquisite blue sapphire-tinted diamond set in a polished platinum band. Designed to deliver a striking balance of sophistication and modern style.',
    ),
    CategoryModel(
      slug: 'pouches',
      title: 'Parker Pen',
      price: 400.0,
      rating: 4,
      imagePath: 'assets/images/parker.jpg',
      description:
          'A classic fine-writing instrument crafted with a durable lacquer barrel and polished gold trim. Delivers smooth ink flow for everyday luxury.',
    ),
    CategoryModel(
      slug: 'sandals',
      title: 'Women’s Ring',
      price: 300.0,
      imagePath: 'assets/images/hand_ring.png',
      description:
          'Delicate sterling silver ring embedded with sparkling crystals. A sleek, minimal accessory designed to complement both formal and casual attire.',
      rating: 4.5,
    ),
    CategoryModel(
      slug: 'pouches',
      title: 'Omega 370',
      price: 450.0,
      rating: 4,
      imagePath: 'assets/images/omega.jpg',
      description:
          'A precision-engineered luxury timepiece with a scratch-resistant sapphire crystal and a premium stainless steel bracelet.',
    ),
    CategoryModel(
      slug: 'sandals',
      title: 'Women’s Penden',
      price: 500.0,
      rating: 5.0,
      imagePath: 'assets/images/penden1.jpg',
      description:
          'A radiant gold pendant featuring a finely detailed halo motif suspended from an adjustable 18-inch chain.',
    ),
    CategoryModel(
      slug: 'sandals',
      title: 'Women’s Exclusive',
      price: 300.0,
      rating: 4,
      imagePath: 'assets/images/penden2.jpg',
      description:
          'An exclusive limited-edition pendant adorned with rose-gold accents, tailored for statement evening looks.',
    ),
  ];

  List<CategoryModel> get categories => List.unmodifiable(_categories);

  CategoryModel? findCategory(String slug) {
    for (final category in _categories) {
      if (category.slug == slug) return category;
    }
    return null;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}