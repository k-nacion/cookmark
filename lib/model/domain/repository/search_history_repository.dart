abstract class SearchHistoryRepository {
  Future<void> saveSearchHistory(List<String> searchHistory);
  Future<List<String>> getSearchHistory();
}
