abstract class SearchHistoryRepository {
  Future<void> setSearchHistory(List<String> searchHistory);
  Future<List<String>> getSearchHistory();
}
