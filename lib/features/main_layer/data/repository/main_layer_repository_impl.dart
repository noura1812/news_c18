import 'package:injectable/injectable.dart';
import 'package:news_c18/common/response_mode/response_model.dart';
import 'package:news_c18/features/main_layer/data/data_source/main_layer_data_source.dart';
import 'package:news_c18/features/main_layer/data/model/artecle_response_model.dart';
import 'package:news_c18/features/main_layer/data/model/resource_model.dart';
import 'package:news_c18/features/main_layer/domain/entities/articles_entity.dart';
import 'package:news_c18/features/main_layer/domain/entities/resource_entity.dart';
import 'package:news_c18/features/main_layer/domain/repository/main_layer_repository.dart';

@Injectable(as: MainLayerRepository)
class MainLayerRepositoryImpl implements MainLayerRepository {
  final MainLayerDataSource _dataSource;

  MainLayerRepositoryImpl(this._dataSource);
  @override
  Future<Response<List<ResourceEntity>>> getResources(String catId) async {
    Response<ResourceModel> response = await _dataSource.getResources(catId);
    switch (response) {
      case Success<ResourceModel>():
        List<ResourceEntity> resources = response.data.sources!
            .map((e) => ResourceEntity(id: e.id, name: e.name))
            .toList();

        return Success<List<ResourceEntity>>(data: resources);

      case Failure<ResourceModel>():
        return Failure<List<ResourceEntity>>(error: response.error);
    }
  }

  @override
  Future<Response<List<ArticlesEntity>>> getArticles(String id) async {
    Response<ArticleResponseModel> response = await _dataSource.getArticles(id);
    switch (response) {
      case Success<ArticleResponseModel>():
        List<ArticlesEntity> articles = response.data.articles!
            .map(
              (e) => ArticlesEntity(
                author: e.author,
                description: e.description,
                publishedAt: e.publishedAt,
                title: e.title,
                url: e.url,
                urlToImage: e.urlToImage,
              ),
            )
            .toList();
        return Success(data: articles);
      case Failure<ArticleResponseModel>():
        return Failure(error: response.error);
    }
  }
}
