
import 'package:go_router/go_router.dart';

import '../../pages/category_page.dart';
import '../../pages/home_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/category/:slug',
        name: 'category',
        builder: (context, state) {
          final slug = state.pathParameters['slug'] ?? '';
          return CategoryPage(slug: slug);
        },
      ),
    ],
  );
}
