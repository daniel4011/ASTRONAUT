import 'package:astronaut/data/datasources/remote/state/error_state.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

extension HttpResponseExtension on HttpResponse {
  ErrorState<T> toErrorState<T>() {
    return ErrorState<T>(DioError(
        error: response.statusMessage,
        response: response,
        requestOptions: response.requestOptions,
        type: DioErrorType.response));
  }
}
