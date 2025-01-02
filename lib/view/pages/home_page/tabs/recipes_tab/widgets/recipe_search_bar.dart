import 'package:cook_mark/viewmodels/search_history_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeSearchBar extends StatefulWidget {
  const RecipeSearchBar({super.key});

  @override
  State<RecipeSearchBar> createState() => _RecipeSearchBarState();
}

class _RecipeSearchBarState extends State<RecipeSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: Consumer<SearchHistoryProvider>(builder: (context, value, child) {
        final searchHistory = value.searchHistory;
        return SearchAnchor.bar(
          barHintText: 'Search',
          barShape:
              WidgetStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          suggestionsBuilder: (context, controller) {
            return List.generate(
              searchHistory.length,
              (index) => ListTile(
                title: Text(searchHistory[index]),
              ),
            );
          },
        );
      }),
    );
  }
}
