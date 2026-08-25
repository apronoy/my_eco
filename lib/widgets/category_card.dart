import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go('/category/${category.slug}'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 0.90,
            child: Hero(
              tag: category.slug,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  category.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return const ColoredBox(
                      color: Color(0xFFF2F2F2),

                      child: Icon(
                        Icons.image_outlined,
                        size: 40,
                        color: Color(0xFF999999),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        category.rating?.toStringAsFixed(1) ?? 'No rating',
                        style: GoogleFonts.montserrat(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.15,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(5, (index) {
                          return Icon(
                            index < (category.rating ?? 0).round()
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber,
                            size: 18,
                          );
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),

                  // Text(
                  //   category.title,
                  //   maxLines: 2,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: GoogleFonts.montserrat(
                  //     fontSize: 12,
                  //     fontWeight: FontWeight.w600,
                  //     letterSpacing: 0.15,
                  //     height: 1.25,
                  //   ),
                  // ),
                  // SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        "\$${category.price.toString()}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.15,
                          height: 1.25,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "\$${(category.price - 70).toString()}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          height: 1.25,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
