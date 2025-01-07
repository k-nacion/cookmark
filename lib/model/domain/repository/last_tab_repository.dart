abstract class LastTabRepository {
  Future<int> getLastTab();
  Future<void> saveLastTab(int tab);
}
