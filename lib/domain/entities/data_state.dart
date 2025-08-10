import 'package:cine_shelf/domain/entities/app_exception_model.dart';

abstract class DataState<T> {
  final T? data;
  final AppException? appException;

  const DataState({this.data, this.appException});
}

class OnLoading<T> extends DataState<T> {
  const OnLoading() : super();
}

class ResultSuccess<T> extends DataState<T> {
  const ResultSuccess(T data) : super(data: data);
}

class ResultFailure<T> extends DataState<T> {
  const ResultFailure(AppException e) : super(appException: e);
}

class ResultNotSet<T> extends DataState<T> {
  const ResultNotSet();
}

class ValidationFailure<T> extends DataState<T> {
  const ValidationFailure(AppException e) : super(appException: e);
}
