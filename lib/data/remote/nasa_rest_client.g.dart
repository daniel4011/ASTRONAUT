// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nasa_rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _NasaRestClient implements NasaRestClient {
  _NasaRestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'DEMO_KEY';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<RemoteNasaPicture>> getNasaPictures(
      {apiKey = ApiConstants.API_URL,
      required startDate,
      required endDate}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': apiKey,
      r'start_date': startDate,
      r'end_date': endDate
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<RemoteNasaPicture>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/planetary/apod',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            RemoteNasaPicture.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<RemoteNasaPicture>> getRandomNasaPictures(
      {apiKey = ApiConstants.API_URL, required count}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': apiKey,
      r'count': count
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<RemoteNasaPicture>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/planetary/apod',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            RemoteNasaPicture.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
