import 'package:cook_mark/model/data/storage/local_storage.dart';
import 'package:cook_mark/model/domain/repository/last_tab_repository.dart';

class LastTabRepositoryImpl implements LastTabRepository {
  final LocalStorage sharedPreferenceManager;

  const LastTabRepositoryImpl({
    required this.sharedPreferenceManager,
  });

  @override
  Future<int> getLastTab() async {
    return await sharedPreferenceManager.getLastTab;
  }

  @override
  Future<void> updateLastTab(int tab) async {
    await sharedPreferenceManager.updateLastTab(tab);
  }
}
