import 'package:feelify/pages/footer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/shop_provider.dart';
import '../widgets/app_header.dart';
import '../widgets/responsive_category_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<ShopProvider>().categories;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(76),
        child: AppHeader(),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1320),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 18, 16, 60),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const _PageTitle(),
                        const SizedBox(height: 20),

                        ResponsiveCategoryGrid(categories: categories),
                      ],
                    ),
                  ),

                  CustomFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PageTitle extends StatelessWidget {
  const _PageTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Discover the Collection',
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.2,
      ),
    );
  }
}
