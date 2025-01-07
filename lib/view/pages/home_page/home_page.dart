import 'package:cook_mark/viewmodels/last_tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LastTabProvider? lastTabProvider;

  @override
  void initState() {
    super.initState();
  }

  void _initializeLastTabListener() async {
    final lastTab = lastTabProvider?.currentTab ?? 0;
    widget.navigationShell.goBranch(lastTab);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    final provider = context.read<LastTabProvider>();
    if (lastTabProvider != provider) {
      lastTabProvider?.removeListener(_initializeLastTabListener);

      lastTabProvider = provider;
      lastTabProvider?.addListener(_initializeLastTabListener);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    lastTabProvider?.removeListener(_initializeLastTabListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: context.watch<LastTabProvider>().currentTab,
        onDestinationSelected: (value) {
          lastTabProvider?.updateCurrentTab(value);
          // widget.navigationShell.goBranch(value);
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
