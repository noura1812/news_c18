import 'package:flutter/material.dart';
import 'package:news_c18/screens/provider/main_screen_provider.dart';
import 'package:news_c18/screens/views/category/cat_details_view.dart';
import 'package:news_c18/screens/views/drawer_view.dart';
import 'package:news_c18/screens/views/home/home_view.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainScreenProvider(),
      child: Consumer<MainScreenProvider>(
        builder: (context, provider, child) => Scaffold(
          appBar: AppBar(
            title: Text(provider.selectedCategory?.name ?? "Home"), //TODO:localization
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          ),
          drawer: DrawerView(),
          body: provider.selectedCategory == null ? HomeView() : CatDetailsView(),
        ),
      ),
    );
  }
}
