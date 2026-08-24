import 'package:feelify/widgets/Purchase_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/shop_provider.dart';
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
                  'Title',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Text(
                  category.title,
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.5,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  'Price',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '\$1,250.00',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      '\$1,250.00',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.grey,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                Text(
                  'Description',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),

                Text(
                  category.description,
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    height: 1.7,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF666666),
                  ),
                ),

                const SizedBox(height: 30),

                CustomButton(text: 'Purchase', onPressed: () {}),

                const SizedBox(height: 15),

                Center(
                  child: Text(
                    'Secure checkout • Fast delivery',
                    style: GoogleFonts.montserrat(
                      fontSize: 11,
                      color: const Color(0xFF888888),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
