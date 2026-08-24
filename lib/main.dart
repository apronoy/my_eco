import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';
import 'providers/shop_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create: (_) => ShopProvider(),
      child: const LuxuryShop(),
    ),
  );
}

class LuxuryShop extends StatelessWidget {
  const LuxuryShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Luxury Store',
      theme: AppTheme.light,
      routerConfig: AppRouter.router,
    );
  }
}
