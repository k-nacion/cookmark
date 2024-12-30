import 'dart:collection';

import 'package:cook_mark/model/domain/repository/search_history_repository.dart';
import 'package:flutter/material.dart';

class SearchHistoryProvider extends ChangeNotifier {
  final SearchHistoryRepository _repository;

  SearchHistoryProvider({
    required SearchHistoryRepository repository,
  }) : _repository = repository;

  List<String> _searchHistory = [];

  List<String> get searchHistory => UnmodifiableListView(_searchHistory);

  void addToHistory(String query) {
    _searchHistory.add(query);
    _repository.setSearchHistory(_searchHistory);
    notifyListeners();
  }

  void getSearchHistory() async {
    _searchHistory = await _repository.getSearchHistory();
    notifyListeners();
  }

  void clearSearchHistory() async {
    _searchHistory.clear();
    notifyListeners();
  }
}
