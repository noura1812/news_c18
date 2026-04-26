import 'package:news_c18/models/resource_model.dart';

abstract class ResourcesCubitState {}

class ResourcesCubitInitialState extends ResourcesCubitState {}

class ResourceLoadingState extends ResourcesCubitState {}

class ResourceSuccessState extends ResourcesCubitState {
  final ResourceModel resourceModel;

  ResourceSuccessState({required this.resourceModel});
}

class ResourceFailureState extends ResourcesCubitState {
  final String errorMessage;

  ResourceFailureState({required this.errorMessage});
}
