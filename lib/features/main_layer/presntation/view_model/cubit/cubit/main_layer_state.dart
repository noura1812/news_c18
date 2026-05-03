part of 'main_layer_cubit.dart';

@immutable
class MainLayerState {
  final bool articlesLoading;
  final bool resourcesLoading;
  final String? articlesErrorMessage;
  final String? resourcesErrorMessage;
  final List<ResourceEntity>? resources;
  final List<ArticlesEntity>? articles;
  final CategoryEnum? selectedCategory;
  const MainLayerState({
    this.articles,
    this.articlesErrorMessage,
    this.articlesLoading = false,
    this.resources,
    this.resourcesErrorMessage,
    this.resourcesLoading = false,
    this.selectedCategory,
  });

  MainLayerState copyWith({
    bool? articlesLoading,
    bool? resourcesLoading,
    String? articlesErrorMessage,
    String? resourcesErrorMessage,
    List<ResourceEntity>? resources,
    List<ArticlesEntity>? articles,
    CategoryEnum? selectedCategory,
  }) {
    return MainLayerState(
      articles: articles ?? this.articles,
      articlesErrorMessage: articlesErrorMessage,
      articlesLoading: articlesLoading ?? this.articlesLoading,
      resources: resources ?? this.resources,
      resourcesErrorMessage: resourcesErrorMessage,
      resourcesLoading: resourcesLoading ?? this.resourcesLoading,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}
