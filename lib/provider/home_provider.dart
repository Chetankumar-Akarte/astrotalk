import 'package:flutter/material.dart';

import '../helper/api.dart';
import '../models/quiz.dart';

class HomeProvider extends ChangeNotifier {
  int tabIndex = 2;
  bool isCategoriesLoading = true;
  List<Quiz> categories = [];

  void changeIndex(int value) {
    tabIndex = value;
    notifyListeners();
  }

  void getQuizCategories() async {
    categories = (await Api.getQuestions());
    isCategoriesLoading = false;
    notifyListeners();
  }

}