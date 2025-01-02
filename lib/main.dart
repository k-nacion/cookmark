import 'package:cook_mark/app/app_router.dart';
import 'package:cook_mark/model/data/repository/last_tab_repository_impl.dart';
import 'package:cook_mark/model/data/repository/recipe_repository_impl.dart';
import 'package:cook_mark/model/data/repository/search_history_repository_impl.dart';
import 'package:cook_mark/model/data/services/http_client.dart';
import 'package:cook_mark/model/data/services/recipe_service.dart';
import 'package:cook_mark/model/data/storage/local_storage.dart';
import 'package:cook_mark/model/domain/repository/last_tab_repository.dart';
import 'package:cook_mark/model/domain/repository/recipe_repository.dart';
import 'package:cook_mark/model/domain/repository/search_history_repository.dart';
import 'package:cook_mark/viewmodels/recipe_list_grid_provider.dart';
import 'package:cook_mark/viewmodels/recipe_viewmodel.dart';
import 'package:cook_mark/viewmodels/search_history_provider.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeDependencies();
  final di = GetIt.I;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.get<RecipeViewmodel>()),
        Provider<AppRouter>(create: (context) => AppRouter()),
        ChangeNotifierProvider<SearchHistoryProvider>(create: (context) => di.get<SearchHistoryProvider>()),
        ChangeNotifierProvider(create: (context) => RecipeListGridProvider()),
      ],
      builder: (context, child) => CookMark(),
    ),
  );
}

Future<void> _initializeDependencies() async {
  final di = GetIt.I;
  final sharedPreferenceInstance = await SharedPreferences.getInstance();
  di.registerLazySingleton<LocalStorage>(() => LocalStorageImpl(sharedPreferences: sharedPreferenceInstance));
  di.registerLazySingleton<SearchHistoryRepository>(
      () => SearchHistoryRepositoryImpl(sharedPreferenceManager: di.get<LocalStorage>()));
  di.registerLazySingleton<LastTabRepository>(
      () => LastTabRepositoryImpl(sharedPreferenceManager: di.get<LocalStorage>()));

  di.registerLazySingleton<HttpClient>(() => HttpClientImpl(client: Client()));
  di.registerLazySingleton<RecipeService>(() => RecipeService(client: di.get<HttpClient>()));
  di.registerLazySingleton<RecipeRepository>(() => RecipeRepositoryImpl(service: di.get<RecipeService>()));
  di.registerLazySingleton<SearchHistoryProvider>(
      () => SearchHistoryProvider(repository: di.get<SearchHistoryRepository>()));
  di.registerLazySingleton<RecipeViewmodel>(() => RecipeViewmodel(repository: di.get<RecipeRepository>()));
}

class CookMark extends StatelessWidget {
  const CookMark({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Cook Mark',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: FlexThemeData.light(
        useMaterial3: true,
        useMaterial3ErrorColors: true,
        scheme: FlexScheme.espresso,
        // swapColors: true,
      ),
      routerConfig: context.read<AppRouter>().router,
    );
  }
}
