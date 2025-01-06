import 'package:flutter/cupertino.dart';

class RecipeListGridProvider extends ChangeNotifier {
  bool _isListView = true;

  bool get isListView => _isListView;

  void toggleView(bool isListView) {
    _isListView = isListView;
    notifyListeners();
  }
}
