import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c18/features/main_layer/presntation/view_model/cubit/resources/resources_cubit_state.dart';

class ResourcesCubit extends Cubit<ResourcesCubitState> {
  ResourcesCubit() : super(ResourcesCubitInitialState());

  getResources(String catId) async {
    emit(ResourceLoadingState());

    // try {
    //   ResourceModel? resources = await NetworkServices.getResources(catId);
    //   if (resources == null) throw "something went wrong try again later";
    //   emit(ResourceSuccessState(resourceModel: resources));
    // } catch (e) {
    //   emit(ResourceFailureState(errorMessage: e.toString()));
    // }
  }
}
