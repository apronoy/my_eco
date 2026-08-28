import 'package:feelify/providers/shop_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      lazy: false,
      create: (_) => ShopProvider()..startCountdown(),
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
