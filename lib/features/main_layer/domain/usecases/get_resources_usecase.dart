import 'package:injectable/injectable.dart';
import 'package:news_c18/common/response_mode/response_model.dart';
import 'package:news_c18/features/main_layer/domain/entities/resource_entity.dart';
import 'package:news_c18/features/main_layer/domain/repository/main_layer_repository.dart';

@injectable
class GetResourcesUsecase {
  final MainLayerRepository mainLayerRepository;

  GetResourcesUsecase({required this.mainLayerRepository});
  Future<Response<List<ResourceEntity>>> call(String catId) async {
    return await mainLayerRepository.getResources(catId);
  }
}
