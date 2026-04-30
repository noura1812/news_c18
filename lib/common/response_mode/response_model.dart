import 'package:news_c18/common/error/error_model.dart';

sealed class Response<T> {}

class Success<T> extends Response<T> {
  final T data;

  Success({required this.data});
}

class Failure<T> extends Response<T> {
  final ErrorModel error;

  Failure({required this.error});
}
