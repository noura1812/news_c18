import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c18/features/main_layer/model/data_source/network_services.dart';
import 'package:news_c18/features/main_layer/view_model/cubit/articles/articles_cubit.dart';
import 'package:news_c18/features/main_layer/view_model/cubit/cubit/main_layer_cubit.dart';
import 'package:news_c18/features/main_layer/view_model/cubit/resources/resources_cubit.dart';
import 'package:news_c18/features/main_layer/model/repository/main_layer_repository.dart';
import 'package:news_c18/features/main_layer/view/views/category/cat_details_view.dart';
import 'package:news_c18/features/main_layer/view/views/drawer_view.dart';
import 'package:news_c18/features/main_layer/view/views/home/home_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ResourcesCubit()),
        BlocProvider(create: (context) => ArticlesCubit()),
        BlocProvider(create: (context) => MainLayerCubit(MainLayerRepository(NetworkServices()))),
      ],
      child: BlocBuilder<MainLayerCubit, MainLayerState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.selectedCategory?.name ?? "Home"), //TODO:localization
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
            ),
            drawer: DrawerView(),
            body: state.selectedCategory == null ? HomeView() : CatDetailsView(),
          );
        },
      ),
    );
  }
}
