import 'package:cook_mark/view/pages/home_page/tabs/recipes_tab/widgets/recipe_search_custom_dropdown_menu_item.dart';
import 'package:cook_mark/viewmodels/search_history_provider.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

class RecipeSearchBar extends StatefulWidget {
  const RecipeSearchBar({super.key});

  @override
  State<RecipeSearchBar> createState() => _RecipeSearchBarState();
}

class _RecipeSearchBarState extends State<RecipeSearchBar> {
  final TextEditingController searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: Consumer<SearchHistoryProvider>(builder: (context, searchHistoryProvider, child) {
        final searchHistory = searchHistoryProvider.searchHistory;
        return SearchBar(
          onSubmitted: (value) {
            searchHistoryProvider.addToHistory(value);
            FocusScope.of(context).unfocus();
          },
          leading: HugeIcon(
            icon: HugeIcons.strokeRoundedSearch01,
            color: Colors.black,
            // size: 18,
          ),
          controller: searchBarController,
          padding: WidgetStatePropertyAll(const EdgeInsets.symmetric(horizontal: 16)),
          trailing: [
            if (searchHistory.isNotEmpty)
              PopupMenuButton<String>(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowDown01,
                  color: Colors.black,
                ),
                onSelected: (value) {
                  searchBarController.text = value;
                  //TODO: implement search here
                },
                itemBuilder: (context) {
                  return searchHistory.map<RecipeSearchCustomDropdownMenuItem<String>>(
                    (e) {
                      return RecipeSearchCustomDropdownMenuItem(
                        value: e.trim(),
                        text: e.trim(),
                        onRemove: () => searchHistoryProvider.removeSearchItem(e),
                      );
                    },
                  ).toList();
                },
              )
          ],
        );
      }),
    );
  }
}
