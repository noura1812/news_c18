import 'package:flutter/material.dart';
import 'package:news_c18/common/enums/category_enum.dart';

class MainScreenProvider extends ChangeNotifier {
  CategoryEnum? selectedCategory;

  // getResources() async {
  //   loadingResources = true;
  //   notifyListeners();
  //   try {
  //     ResourceModel? resources = await NetworkServices.getResources(selectedCategory!.name);
  //     resourceModel = resources;
  //   } catch (e) {
  //     errorMessage = e.toString();
  //   }
  //   loadingResources = false;
  //   notifyListeners();
  // }

  // getArticles(String resourceId) async {
  //   errorMessageArticles = null;

  //   loadingArticles = true;
  //   notifyListeners();
  //   try {
  //     ArticleResponseModel? articles = await NetworkServices.getArticles(resourceId);
  //     articleResponseModel = articles;
  //   } catch (e) {
  //     errorMessageArticles = e.toString();
  //   }
  //   loadingArticles = false;
  //   notifyListeners();
  // }
}
