import 'package:dio/dio.dart';

class RequestState<T> {
  final T? responseData;
  final DioError? error;

  const RequestState({this.responseData, this.error});
}
