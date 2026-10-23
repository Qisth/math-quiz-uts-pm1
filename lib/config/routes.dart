import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/menu_screen.dart';
import '../screens/quiz_screen.dart';
import '../screens/results_screen.dart';

class AppRoutes {
  static const String menu = '/';
  static const String quiz = '/quiz';
  static const String results = '/results';
}

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter() {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.menu,
    routes: [
      GoRoute(
        path: AppRoutes.menu,
        name: 'menu',
        builder: (context, state) => const MenuScreen(),
      ),

      GoRoute(
        path: AppRoutes.quiz,
        name: 'quiz',
        builder: (context, state) => const QuizScreen(),
      ),

      GoRoute(
        path: AppRoutes.results,
        name: 'results',
        builder: (context, state) => const ResultsScreen(),
      ),
    ],
  );
}
