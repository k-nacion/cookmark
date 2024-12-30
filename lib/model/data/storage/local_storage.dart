import 'package:cook_mark/app/shared_preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  Future<List<String>> get getSearchHistory;

  Future<int> get getLastTab;

  Future<void> updateSearchHistory(List<String> searchHistory);

  Future<void> updateLastTab(int tab);
}

class LocalStorageImpl implements LocalStorage {
  final SharedPreferences sharedPreferences;

  const LocalStorageImpl({
    required this.sharedPreferences,
  });

  @override
  Future<int> get getLastTab async {
    return sharedPreferences.getInt(SharedPreferencesKeys.lastCurrentTab)!;
  }

  @override
  // TODO: implement getSearchHistory
  Future<List<String>> get getSearchHistory async =>
      sharedPreferences.getStringList(SharedPreferencesKeys.searchHistory)!;

  @override
  Future<void> updateLastTab(int tab) async {
    await sharedPreferences.setInt(SharedPreferencesKeys.lastCurrentTab, tab);
  }

  @override
  Future<void> updateSearchHistory(List<String> searchHistory) async {
    await sharedPreferences.setStringList(SharedPreferencesKeys.searchHistory, searchHistory);
  }
}
