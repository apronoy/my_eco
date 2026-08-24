import 'package:flutter/material.dart';

import '../models/category_model.dart';
import 'category_card.dart';

class ResponsiveCategoryGrid extends StatelessWidget {
  final List<CategoryModel> categories;

  const ResponsiveCategoryGrid({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        // Mobile: 2 columns, like the supplied reference.
        // Tablet: 3 columns.
        // Laptop/desktop: 4 columns.
        final columns = width < 650
            ? 2
            : width < 1000
                ? 3
                : 4;

        final gap = width < 650 ? 16.0 : 24.0;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: gap,
            mainAxisSpacing: width < 650 ? 30 : 42,
            childAspectRatio: width < 650 ? 0.69 : 0.72,
          ),
          itemBuilder: (context, index) {
            return CategoryCard(category: categories[index]);
          },
        );
      },
    );
  }
}
