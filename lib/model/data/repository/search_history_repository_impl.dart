import 'package:cook_mark/model/data/storage/shared_preference_manager.dart';
import 'package:cook_mark/model/domain/repository/search_history_repository.dart';

class SearchHistoryRepositoryImpl implements SearchHistoryRepository {
  final SharedPreferenceManager sharedPreferenceManager;

  const SearchHistoryRepositoryImpl({
    required this.sharedPreferenceManager,
  });

  @override
  Future<List<String>> getSearchHistory() async {
    return await sharedPreferenceManager.getSearchHistory;
  }

  @override
  Future<void> setSearchHistory(List<String> searchHistory) async {
    await sharedPreferenceManager.updateSearchHistory(searchHistory);
  }
}
