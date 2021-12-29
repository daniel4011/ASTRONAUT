import 'dart:io';

import 'package:astronaut/data/datasources/extensions/http_response_extension.dart';
import 'package:astronaut/data/datasources/remote/model/nasa_picture/remote_nasa_picture.dart';
import 'package:astronaut/data/datasources/remote/nasa_rest_client.dart';
import 'package:astronaut/data/datasources/remote/state/error_state.dart';
import 'package:astronaut/data/datasources/remote/state/request_state.dart';
import 'package:astronaut/data/datasources/remote/state/sucess_state.dart';
import 'package:astronaut/domain/repositories/pictures_repository.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class PicturesRepositoryImpl implements PicturesRepository {
  final NasaRestClient _nasaRestClient;
  final Logger _logger;

  const PicturesRepositoryImpl(this._nasaRestClient, this._logger);

  @override
  Future<RequestState<List<RemoteNasaPicture>>> getNasaPictures(
      {required String startDate, required String endDate}) async {
    try {
      final response = await _nasaRestClient.getNasaPictures(
          startDate: startDate, endDate: endDate);

      if (response.response.statusCode == HttpStatus.ok) {
        return SuccessState(responseData: response.data);
      }

      _logger.e(response.response.statusMessage);
      return response.toErrorState();
    } on DioError catch (exception) {
      _logger.e(exception.message);
      return ErrorState(exception);
    }
  }

  @override
  Future<RequestState<List<RemoteNasaPicture>>> getRandomNasaPictures(
      {required int count}) async {
    try {
      final response =
          await _nasaRestClient.getRandomNasaPictures(count: count);

      if (response.response.statusCode == HttpStatus.ok) {
        return SuccessState(responseData: response.data);
      }

      return response.toErrorState();
    } on DioError catch (exception) {
      return ErrorState(exception);
    }
  }
}
