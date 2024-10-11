import 'package:feature_based/feature/Home/view/home_screen.dart';
import 'package:go_router/go_router.dart';

import '../feature/Chat/view/chat_screen.dart';
import '../feature/Home/model/history.dart';

class AppRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomeScreen();
      },
      routes: [
        GoRoute(
            path: 'chat',
            builder: (context, state) {
              final history = state.extra as History;
              return ChatScreen(history: history);
            })
      ],
    )
  ]);
}
