import 'package:feature_based/feature/feature_1/view/screen_1.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const Screen1();
      },
    )
  ]);
}
