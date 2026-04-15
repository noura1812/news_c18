import 'package:flutter/material.dart';
import 'package:news_c18/common/enums/category_enum.dart';

class MainScreenProvider extends ChangeNotifier {
  CategoryEnum? selectedCategory;

  selectCategory(CategoryEnum category) {
    selectedCategory = category;
    notifyListeners();
  }

  removeSelectedCategory() {
    selectedCategory = null;
    notifyListeners();
  }
}
