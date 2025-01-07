import 'package:cook_mark/model/data/storage/local_storage.dart';
import 'package:cook_mark/model/domain/repository/last_tab_repository.dart';

class LastTabRepositoryImpl implements LastTabRepository {
  final LocalStorage localStorage;

  const LastTabRepositoryImpl({
    required this.localStorage,
  });

  @override
  Future<int> getLastTab() async {
    return await localStorage.getLastTab;
  }

  @override
  Future<void> saveLastTab(int tab) async {
    await localStorage.updateLastTab(tab);
  }
}
