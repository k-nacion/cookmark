import 'package:cook_mark/view/pages/home_page/home_page.dart';
import 'package:cook_mark/view/pages/home_page/tabs/recipes_tab/recipe_tab.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final recipeTabNavigatorKey = GlobalKey<NavigatorState>();
final bookmarkNavigatorKey = GlobalKey<NavigatorState>();
final groceriesNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/recipe',
    navigatorKey: rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state, navigationShell) => HomePage(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: recipeTabNavigatorKey,
            routes: [
              GoRoute(
                path: '/recipe',
                name: 'recipe',
                builder: (context, state) => RecipeTab(),
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: bookmarkNavigatorKey,
            routes: [
              GoRoute(
                path: '/bookmarks',
                name: 'bookmarks',
                builder: (context, state) => Placeholder(color: Colors.green),
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: groceriesNavigatorKey,
            routes: [
              GoRoute(
                path: '/cart',
                name: 'cart',
                builder: (context, state) => Placeholder(color: Colors.blue),
              )
            ],
          ),
        ],
      ),
    ],
  );
}
