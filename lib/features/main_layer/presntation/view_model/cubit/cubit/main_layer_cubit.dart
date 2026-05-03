import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:news_c18/common/enums/category_enum.dart';
import 'package:news_c18/common/response_mode/response_model.dart';
import 'package:news_c18/features/main_layer/domain/entities/articles_entity.dart';
import 'package:news_c18/features/main_layer/domain/entities/resource_entity.dart';
import 'package:news_c18/features/main_layer/domain/usecases/get_articles_usecase.dart';
import 'package:news_c18/features/main_layer/domain/usecases/get_resources_usecase.dart';

part 'main_layer_state.dart';

@injectable
class MainLayerCubit extends Cubit<MainLayerState> {
  MainLayerCubit(this._getArticlesUsecase, this._getResourcesUsecase) : super(MainLayerState());
  final GetArticlesUsecase _getArticlesUsecase;
  final GetResourcesUsecase _getResourcesUsecase;
  selectCategory(CategoryEnum category) {
    emit(state.copyWith(selectedCategory: category));
  }

  removeSelectedCategory() {
    emit(MainLayerState());
  }

  getArticles(String resourceId) async {
    emit(state.copyWith(articlesLoading: true));

    Response<List<ArticlesEntity>> response = await _getArticlesUsecase(resourceId);
    switch (response) {
      case Success<List<ArticlesEntity>>():
        emit(
          state.copyWith(
            articlesLoading: false,
            articles: response.data,
            articlesErrorMessage: null,
          ),
        );
      case Failure<List<ArticlesEntity>>():
        emit(
          state.copyWith(
            articlesLoading: false,
            articles: null,
            articlesErrorMessage: response.error.toString(),
          ),
        );
    }
  }

  getResources() async {
    if (state.selectedCategory == null) return;
    emit(state.copyWith(resourcesLoading: true));

    Response<List<ResourceEntity>> response = await _getResourcesUsecase(
      state.selectedCategory!.name,
    );
    switch (response) {
      case Success<List<ResourceEntity>>():
        List<ResourceEntity> resourceModel = response.data;
        emit(state.copyWith(resourcesLoading: false, resources: resourceModel));
      case Failure<List<ResourceEntity>>():
        emit(
          state.copyWith(resourcesLoading: false, resourcesErrorMessage: response.error.toString()),
        );
    }
  }
}
