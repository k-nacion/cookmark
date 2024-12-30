import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (value) {
          navigationShell.goBranch(value);
        },
        destinations: [
          NavigationDestination(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedCookie, color: Colors.black, size: 24.0),
            label: 'Recipes',
          ),
          NavigationDestination(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedAllBookmark, color: Colors.black, size: 24.0),
            label: 'Bookmarks',
          ),
          NavigationDestination(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedShoppingCart01, color: Colors.black, size: 24.0),
            label: 'Recipes',
          ),
        ],
      ),
    );
  }
}
