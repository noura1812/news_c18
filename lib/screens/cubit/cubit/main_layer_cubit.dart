import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_c18/common/enums/category_enum.dart';
import 'package:news_c18/common/response_mode/response_model.dart';
import 'package:news_c18/models/artecle_response_model.dart';
import 'package:news_c18/models/resource_model.dart';
import 'package:news_c18/network/network_services.dart';

part 'main_layer_state.dart';

class MainLayerCubit extends Cubit<MainLayerState> {
  MainLayerCubit() : super(MainLayerState());

  selectCategory(CategoryEnum category) {
    emit(state.copyWith(selectedCategory: category));
  }

  removeSelectedCategory() {
    emit(MainLayerState());
  }

  getArticles(String resourceId) async {
    emit(state.copyWith(articlesLoading: true));

    Response<ArticleResponseModel> response = await NetworkServices.getArticles(resourceId);
    switch (response) {
      case Success<ArticleResponseModel>():
        emit(
          state.copyWith(
            articlesLoading: false,
            articleResponseModel: response.data,
            articlesErrorMessage: null,
          ),
        );
      case Failure<ArticleResponseModel>():
        emit(
          state.copyWith(
            articlesLoading: false,
            articleResponseModel: null,
            articlesErrorMessage: response.error.toString(),
          ),
        );
    }
  }

  getResources() async {
    if (state.selectedCategory == null) return;
    emit(state.copyWith(resourcesLoading: true));

    Response<ResourceModel> response = await NetworkServices.getResources(
      state.selectedCategory!.name,
    );
    switch (response) {
      case Success<ResourceModel>():
        ResourceModel resourceModel = response.data;
        emit(state.copyWith(resourcesLoading: false, resourceModel: resourceModel));
      case Failure<ResourceModel>():
        emit(
          state.copyWith(resourcesLoading: false, resourcesErrorMessage: response.error.toString()),
        );
    }
  }
}
