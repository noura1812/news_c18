part of 'main_layer_cubit.dart';

@immutable
class MainLayerState {
  final bool articlesLoading;
  final bool resourcesLoading;
  final String? articlesErrorMessage;
  final String? resourcesErrorMessage;
  final ResourceModel? resourceModel;
  final ArticleResponseModel? articleResponseModel;
  final CategoryEnum? selectedCategory;
  const MainLayerState({
    this.articleResponseModel,
    this.articlesErrorMessage,
    this.articlesLoading = false,
    this.resourceModel,
    this.resourcesErrorMessage,
    this.resourcesLoading = false,
    this.selectedCategory,
  });

  MainLayerState copyWith({
    bool? articlesLoading,
    bool? resourcesLoading,
    String? articlesErrorMessage,
    String? resourcesErrorMessage,
    ResourceModel? resourceModel,
    ArticleResponseModel? articleResponseModel,
    CategoryEnum? selectedCategory,
  }) {
    return MainLayerState(
      articleResponseModel: articleResponseModel ?? this.articleResponseModel,
      articlesErrorMessage: articlesErrorMessage,
      articlesLoading: articlesLoading ?? this.articlesLoading,
      resourceModel: resourceModel ?? this.resourceModel,
      resourcesErrorMessage: resourcesErrorMessage,
      resourcesLoading: resourcesLoading ?? this.resourcesLoading,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}
