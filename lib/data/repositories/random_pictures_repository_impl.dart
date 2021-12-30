import 'dart:io';

import 'package:astronaut/data/datasources/extensions/http_response_extension.dart';
import 'package:astronaut/data/datasources/local/application_database.dart';
import 'package:astronaut/data/datasources/local/entity/random_picture.dart';
import 'package:astronaut/data/datasources/remote/nasa_rest_client.dart';
import 'package:astronaut/data/datasources/remote/state/error_state.dart';
import 'package:astronaut/data/datasources/remote/state/request_state.dart';
import 'package:astronaut/domain/repositories/random_pictures_repository.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class RandomPicturesRepositoryImpl implements RandomPicturesRepository {
  final NasaRestClient _nasaRestClient;
  final Logger _logger;
  final ApplicationDatabase _database;

  const RandomPicturesRepositoryImpl(
      this._nasaRestClient, this._logger, this._database);

  @override
  Future<RequestState<List<RandomPicture>>> fetchNasaRandomPictures(
      {required int count}) async {
    try {
      final response =
          await _nasaRestClient.getRandomNasaPictures(count: count);

      if (response.response.statusCode == HttpStatus.ok) {
        /* return SuccessState(
            responseData: response.data
                .where((element) => MediaType.isSupported(element.mediaType))
                .toList());*/
      }

      _logger.e(response.response.statusMessage);
      return response.toErrorState();
    } on DioError catch (exception) {
      _logger.e(exception.message);
      return ErrorState(exception);
    }
  }

  @override
  Future<List<RandomPicture>> getSavedPictures() {
    return _database.randomPicturesDao.getPictures();
  }

  @override
  Future<void> insertPicture(RandomPicture entity) {
    return _database.randomPicturesDao.insertPicture(entity);
  }

  @override
  Future<void> insertPictures(List<RandomPicture> entities) {
    return _database.randomPicturesDao.insertPictures(entities);
  }

  @override
  Future<void> deletePicture(RandomPicture entity) {
    return _database.randomPicturesDao.deletePicture(entity);
  }

  @override
  Future<void> deleteAllPictures() {
    return _database.randomPicturesDao.clear();
  }
}
