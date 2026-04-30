part of "articles_cubit.dart";

sealed class ArticlesCubitState {}

class ArticlesInitialCubitState extends ArticlesCubitState {}

class ArticlesLoadingState extends ArticlesCubitState {}

class ArticlesSuccessState extends ArticlesCubitState {
  final ArticleResponseModel articleResponseModel;

  ArticlesSuccessState({required this.articleResponseModel});
}

class ArticlesFailureState extends ArticlesCubitState {
  final String errorMessage;

  ArticlesFailureState({required this.errorMessage});
}
