import 'package:injectable/injectable.dart';
import 'package:news_c18/common/response_mode/response_model.dart';
import 'package:news_c18/features/main_layer/domain/entities/articles_entity.dart';
import 'package:news_c18/features/main_layer/domain/repository/main_layer_repository.dart';

@injectable
class GetArticlesUsecase {
  final MainLayerRepository mainLayerRepository;

  GetArticlesUsecase({required this.mainLayerRepository});
  Future<Response<List<ArticlesEntity>>> call(String id) async {
    return await mainLayerRepository.getArticles(id);
  }
}
