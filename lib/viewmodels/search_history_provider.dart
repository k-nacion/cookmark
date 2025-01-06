import 'dart:collection';

import 'package:cook_mark/model/domain/repository/search_history_repository.dart';
import 'package:flutter/material.dart';

class SearchHistoryProvider extends ChangeNotifier {
  final SearchHistoryRepository _repository;

  List<String> _searchHistory = [];

  List<String> get searchHistory => UnmodifiableListView(_searchHistory);

  SearchHistoryProvider({
    required SearchHistoryRepository repository,
  }) : _repository = repository {
    _initializeSearchHistory();
  }

  Future<void> _initializeSearchHistory() async {
    try {
      _searchHistory = await _repository.getSearchHistory();
    } catch (e) {
      debugPrint('Failed to fetch search history: $e');
      _searchHistory.clear();
    }
    notifyListeners();
  }

  void addToHistory(String query) {
    if (!_searchHistory.contains(query)) {
      _searchHistory.add(query);
      notifyListeners();
      _saveToRepository();
    }
  }

  void removeSearchItem(String query) {
    _searchHistory.removeWhere((element) => element == query);
    notifyListeners();
    _saveToRepository();
  }

  void clearSearchHistory() {
    _searchHistory.clear();
    notifyListeners();
    _saveToRepository();
  }

  /// Saves the current search history to the repository
  Future<void> _saveToRepository() async {
    try {
      await _repository.saveSearchHistory(_searchHistory);
    } catch (e) {
      // Handle error (e.g., log it or notify the user)
      debugPrint("Failed to save search history: $e");
    }
  }
}
