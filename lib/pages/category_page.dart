import 'package:feelify/providers/shop_provider.dart';
import 'package:feelify/widgets/Purchase_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../widgets/app_header.dart';

class CategoryPage extends StatelessWidget {
  final String slug;

  const CategoryPage({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    final category = context.read<ShopProvider>().findCategory(slug);

    if (category == null) {
      return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(76),
          child: AppHeader(),
        ),
        body: const Center(child: Text('Category not found')),
      );
    }

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(76),
        child: AppHeader(),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 550),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Hero(
                    tag: category.slug,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(
                        category.imagePath,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                Text(
                  'Name',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      category.title,
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.5,
                        color: Colors.black,
                      ),
                    ),
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
                        const SizedBox(width: 10),
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
                  ],
                ),

                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),

                    Row(
                      children: [
                        Text(
                          "\$${category.price.toString()}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                            height: 1.25,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "\$${(category.price - 70).toString()}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
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

                const SizedBox(height: 18),

                Text(
                  'About ',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 7),

                Text(
                  category.description,
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    height: 1.7,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 30),

                CustomButton(text: 'Add to Cart', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
