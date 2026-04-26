import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_c18/common/enums/category_enum.dart';
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
    try {
      ArticleResponseModel? articles = await NetworkServices.getArticles(resourceId);
      if (articles == null) throw "something went wrong. try again later";
      emit(
        state.copyWith(
          articlesLoading: false,
          articleResponseModel: articles,
          articlesErrorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          articlesLoading: false,
          articleResponseModel: null,
          articlesErrorMessage: e.toString(),
        ),
      );
    }
  }

  getResources(String catId) async {
    emit(state.copyWith(resourcesLoading: true));

    try {
      ResourceModel? resources = await NetworkServices.getResources(catId);
      if (resources == null) throw "something went wrong try again later";
      emit(
        state.copyWith(
          resourcesLoading: false,
          resourcesErrorMessage: null,
          resourceModel: resources,
        ),
      );
    } catch (e) {
      state.copyWith(
        resourcesLoading: false,
        resourcesErrorMessage: e.toString(),
        resourceModel: null,
      );
    }
  }
}
