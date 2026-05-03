import 'package:news_c18/common/response_mode/response_model.dart';
import 'package:news_c18/features/main_layer/data/data_source/main_layer_data_source.dart';
import 'package:news_c18/features/main_layer/data/model/artecle_response_model.dart';
import 'package:news_c18/features/main_layer/data/model/resource_model.dart';

class CashDataSource implements MainLayerDataSource {
  @override
  Future<Response<ArticleResponseModel>> getArticles(String id) {
    // TODO: implement getArticles
    throw UnimplementedError();
  }

  @override
  Future<Response<ResourceModel>> getResources(String catId) {
    // TODO: implement getResources
    throw UnimplementedError();
  }
}
