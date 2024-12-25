import 'package:cook_mark/app/app_router.dart';
import 'package:cook_mark/model/data/repository/recipe_repository_impl.dart';
import 'package:cook_mark/model/data/services/http_client.dart';
import 'package:cook_mark/model/data/services/recipe_service.dart';
import 'package:cook_mark/model/domain/repository/recipe_repository.dart';
import 'package:cook_mark/viewmodels/recipe_viewmodel.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

void main() async {
  await _initializeDependencies();
  final di = GetIt.I;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RecipeViewmodel(
            repository: di.get<RecipeRepository>(),
          ),
        ),
        Provider<AppRouter>(create: (context) => AppRouter()),
      ],
      builder: (context, child) => CookMark(),
    ),
  );
}

Future<void> _initializeDependencies() async {
  final di = GetIt.I;
  di.registerLazySingleton<HttpClient>(() => HttpClientImpl(client: Client()));
  di.registerLazySingleton<RecipeService>(() => RecipeService(client: di.get<HttpClient>()));
  di.registerLazySingleton<RecipeRepository>(() => RecipeRepositoryImpl(service: di.get<RecipeService>()));
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
        swapColors: true,
      ),
      routerConfig: context.read<AppRouter>().router,
    );
  }
}
