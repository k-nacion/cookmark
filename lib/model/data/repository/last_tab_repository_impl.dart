import 'package:cook_mark/model/data/storage/shared_preference_manager.dart';
import 'package:cook_mark/model/domain/repository/last_tab_repository.dart';

class LastTabRepositoryImpl implements LastTabRepository {
  final SharedPreferenceManager sharedPreferenceManager;

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
