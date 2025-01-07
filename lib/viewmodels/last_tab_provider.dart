import 'package:cook_mark/model/domain/repository/last_tab_repository.dart';
import 'package:flutter/cupertino.dart';

class LastTabProvider extends ChangeNotifier {
  final LastTabRepository _repository;

  int _currentTab = 0;

  int get currentTab => _currentTab;

  LastTabProvider({
    required LastTabRepository repository,
  }) : _repository = repository {
    _initializeState();
  }

  // void initialize() async => await _initializeState();

  Future<void> _initializeState() async {
    try {
      _currentTab = await _repository.getLastTab();
    } catch (e) {
      debugPrint('Failed to retrieve saved tab from repository: $e\n${StackTrace.current}');
      _currentTab = 0;
    }
    notifyListeners();
  }

  Future<void> _persistCurrentTab() async {
    try {
      await _repository.saveLastTab(_currentTab);
    } catch (e) {
      debugPrint('Failed to save tab to repository: $e\n${StackTrace.current}');
    }
  }

  void updateCurrentTab(int value) async {
    if (_currentTab != value) {
      _currentTab = value;
      await _persistCurrentTab();
      notifyListeners();
    }
  }
}
