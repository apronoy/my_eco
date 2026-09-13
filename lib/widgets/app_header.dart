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
                onPressed: () => _showMenu(context),
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
                    'Luxury Shop',
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

  // ================= MENU =================
void _showMenu(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (_) {
      return SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Menu',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Divider(),

                  _menuItem(
                    context,
                    icon: Icons.home_outlined,
                    title: 'Home',
                    route: '/',
                  ),

                  _menuItem(
                    context,
                    icon: Icons.checkroom_outlined,
                    title: 'Men',
                    route: '/category/men',
                  ),

                  _menuItem(
                    context,
                    icon: Icons.woman_outlined,
                    title: 'Women',
                    route: '/category/women',
                  ),

                  _menuItem(
                    context,
                    icon: Icons.diamond_outlined,
                    title: 'Jewelry',
                    route: '/category/jewelery',
                  ),

                  _menuItem(
                    context,
                    icon: Icons.devices_outlined,
                    title: 'Electronics',
                    route: '/category/electronics',
                  ),

                  _menuItem(
                    context,
                    icon: Icons.shopping_cart_outlined,
                    title: 'Cart',
                    route: '/cart',
                  ),
                ],
              ),
            ),
          ),
        )
      );
    },
  );
}

  Widget _menuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String route,
  }) {
    return ListTile(
      leading: Icon(icon, size: 23),
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
      onTap: () {
        Navigator.pop(context);
        context.go(route);
      },
    );
  }

  // ================= ACCOUNT =================

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
