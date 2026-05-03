import 'package:news_c18/common/response_mode/response_model.dart';
import 'package:news_c18/features/main_layer/data/model/artecle_response_model.dart';
import 'package:news_c18/features/main_layer/data/model/resource_model.dart';

abstract class MainLayerDataSource {
  Future<Response<ArticleResponseModel>> getArticles(String id);
  Future<Response<ResourceModel>> getResources(String catId);
}
