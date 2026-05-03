import 'package:news_c18/common/response_mode/response_model.dart';
import 'package:news_c18/features/main_layer/domain/entities/articles_entity.dart';
import 'package:news_c18/features/main_layer/domain/entities/resource_entity.dart';

abstract class MainLayerRepository {
  Future<Response<List<ResourceEntity>>> getResources(String catId);
  Future<Response<List<ArticlesEntity>>> getArticles(String id);
}
