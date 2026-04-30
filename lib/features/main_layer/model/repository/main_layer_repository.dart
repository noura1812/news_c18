import 'package:news_c18/common/response_mode/response_model.dart';
import 'package:news_c18/features/main_layer/model/models/artecle_response_model.dart';
import 'package:news_c18/features/main_layer/model/models/resource_model.dart';
import 'package:news_c18/features/main_layer/model/data_source/network_services.dart';

class MainLayerRepository {
  final NetworkServices _networkServices;

  MainLayerRepository(this._networkServices);
  Future<Response<ResourceModel>> getResources(String catId) async {
    Response<ResourceModel> response = await _networkServices.getResources(catId);
    return response;
  }

  Future<Response<ArticleResponseModel>> getArticles(String id) async {
    Response<ArticleResponseModel> response = await _networkServices.getArticles(id);
    return response;
  }
}
