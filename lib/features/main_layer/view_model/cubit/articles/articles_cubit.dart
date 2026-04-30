import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c18/features/main_layer/model/models/artecle_response_model.dart';
import 'package:news_c18/features/main_layer/model/data_source/network_services.dart';

part "articles_cubit_state.dart";

class ArticlesCubit extends Cubit<ArticlesCubitState> {
  ArticlesCubit() : super(ArticlesInitialCubitState());

  getArticles(String resourceId) async {
    // emit(ArticlesLoadingState());
    // try {
    //   ArticleResponseModel? articles = await NetworkServices.getArticles(resourceId);
    //   if (articles == null) throw "something went wrong. try again later";
    //   emit(ArticlesSuccessState(articleResponseModel: articles));
    // } catch (e) {
    //   emit(ArticlesFailureState(errorMessage: e.toString()));
    // }
  }
}
