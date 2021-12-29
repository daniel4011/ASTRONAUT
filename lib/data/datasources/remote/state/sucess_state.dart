import 'request_state.dart';

class SuccessState<T> extends RequestState<T> {
  const SuccessState({required T responseData})
      : super(responseData: responseData);
}
