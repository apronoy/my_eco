import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;

        return Container(
          height: isDesktop ? 76 : 64,
          padding: EdgeInsets.symmetric(horizontal: isDesktop ? 32 : 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Color(0xFFF0F0F0), width: 1),
            ),
          ),
          child: Row(
            children: [
              // Menu
              IconButton(
                tooltip: 'Menu',
                onPressed: () {},
                icon: const Icon(Icons.menu_rounded, size: 22),
              ),

              const Spacer(),

              // Logo
              InkWell(
                onTap: () => context.go('/'),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Luxary Shop',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 27,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      letterSpacing: -2,
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // Cart
              IconButton(
                tooltip: 'Cart',
                onPressed: () {
                  context.go('/cart');
                },
                icon: const Icon(Icons.shopping_cart_outlined, size: 23),
              ),

              // Account
              IconButton(
                tooltip: 'Account',
                onPressed: () => _showAccount(context),
                icon: const Icon(Icons.person_outline_rounded, size: 23),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAccount(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Account'),
        content: const Text("You haven't login yet, Please login"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
