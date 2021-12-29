import 'package:dio/dio.dart';

import 'request_state.dart';

class ErrorState<T> extends RequestState<T> {
  const ErrorState(DioError error) : super(error: error);
}
