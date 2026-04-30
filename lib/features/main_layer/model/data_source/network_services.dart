import 'package:dio/dio.dart';
import 'package:news_c18/common/error/error_model.dart';
import 'package:news_c18/features/main_layer/model/models/artecle_response_model.dart';
import 'package:news_c18/features/main_layer/model/models/resource_model.dart';
import 'package:news_c18/common/endpoint/endpoints.dart';
import 'package:news_c18/common/response_mode/response_model.dart' as resp;

class NetworkServices {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: Endpoints.baseUrl, headers: {"X-Api-Key": Endpoints.apiKey}),
  );
  Future<resp.Response<ResourceModel>> getResources(String category) async {
    try {
      Response response = await _dio.get(
        Endpoints.sources,
        queryParameters: {"category": category},
      );
      if (response.statusCode == 200 && response.data['status'].toString().toLowerCase() == 'ok') {
        return resp.Success<ResourceModel>(data: ResourceModel.fromJson(response.data));
      } else if (response.data['message'] != null) {
        throw GeneralError(response.data['message']);
      } else {
        throw GeneralError();
      }
    } catch (e) {
      return ErrorModel.handelError(e);
    }
  }

  Future<resp.Response<ArticleResponseModel>> getArticles(String resourceId) async {
    try {
      Response response = await _dio.get(
        Endpoints.articles,
        queryParameters: {"sources": resourceId},
      );
      if (response.statusCode == 200 && response.data['status'].toString().toLowerCase() == 'ok') {
        return resp.Success(data: ArticleResponseModel.fromJson(response.data));
      } else if (response.data['message'] != null) {
        throw GeneralError(response.data['message']);
      } else {
        throw GeneralError();
      }
    } catch (e) {
      return ErrorModel.handelError<ArticleResponseModel>(e);
    }
  }
}
