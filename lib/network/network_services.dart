import 'package:dio/dio.dart';
import 'package:news_c18/models/artecle_response_model.dart';
import 'package:news_c18/models/resource_model.dart';
import 'package:news_c18/network/endpoints.dart';

class NetworkServices {
  static final Dio _dio = Dio(
    BaseOptions(baseUrl: Endpoints.baseUrl, headers: {"X-Api-Key": Endpoints.apiKey}),
  );
  static Future<ResourceModel?> getResources(String category) async {
    Response response = await _dio.get(Endpoints.sources, queryParameters: {"category": category});
    if (response.statusCode == 200 && response.data['status'].toString().toLowerCase() == 'ok') {
      return ResourceModel.fromJson(response.data);
    }
  }

  static Future<ArticleResponseModel?> getArticles(String resourceId) async {
    Response response = await _dio.get(
      Endpoints.articles,
      queryParameters: {"sources": resourceId},
    );
    if (response.statusCode == 200 && response.data['status'].toString().toLowerCase() == 'ok') {
      return ArticleResponseModel.fromJson(response.data);
    }
  }
}
