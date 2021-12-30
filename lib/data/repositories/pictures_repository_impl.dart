import 'dart:io';

import 'package:astronaut/data/datasources/extensions/http_response_extension.dart';
import 'package:astronaut/data/datasources/local/application_database.dart';
import 'package:astronaut/data/datasources/local/entity/picture_entity.dart';
import 'package:astronaut/data/datasources/remote/model/nasa_picture/remote_nasa_picture.dart';
import 'package:astronaut/data/datasources/remote/nasa_rest_client.dart';
import 'package:astronaut/data/datasources/remote/state/error_state.dart';
import 'package:astronaut/data/datasources/remote/state/request_state.dart';
import 'package:astronaut/data/datasources/remote/state/sucess_state.dart';
import 'package:astronaut/data/usecase/decode_image_use_case.dart';
import 'package:astronaut/domain/repositories/pictures_repository.dart';
import 'package:astronaut/presentation/core/media_type.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class PicturesRepositoryImpl implements PicturesRepository {
  final NasaRestClient _nasaRestClient;
  final Logger _logger;
  final ApplicationDatabase _database;
  final DecodeImageUseCase _decoder;

  const PicturesRepositoryImpl(
      this._nasaRestClient, this._logger, this._database, this._decoder);

  @override
  Future<RequestState<List<RemoteNasaPicture>>> fetchNasaPictures(
      {required String startDate, required String endDate}) async {
    _logger.d(
        "Fetch nasa pictures with parameters: startDate: $startDate endDate: $endDate");

    try {
      final response = await _nasaRestClient.getNasaPictures(
          startDate: startDate, endDate: endDate);

      if (response.response.statusCode == HttpStatus.ok) {
        final pictures = response.data
            .where((element) => MediaType.isSupported(element.mediaType))
            .toList();

        _logger.d("Received ${pictures.length} images");

        await _storePictures(pictures);
        return SuccessState(responseData: pictures);
      }

      _logger.e(response);
      return response.toErrorState();
    } on DioError catch (error) {
      _logger.e(error.response);
      return ErrorState(error);
    }
  }

  @override
  Future<void> clearPictures() {
    return _database.picturesDao.clear();
  }

  @override
  Future<List<Picture>> getSavedNasaPictures() {
    return _database.picturesDao.getPictures();
  }

  @override
  Future<void> deletePicture(Picture entity) {
    return _database.picturesDao.deletePicture(entity);
  }

  @override
  Future<void> insertPicture(Picture entity) {
    return _database.picturesDao.insertPicture(entity);
  }

  @override
  Future<void> insertPictures(List<Picture> entities) {
    return _database.picturesDao.insertPictures(entities);
  }

  Future<void> _storePictures(List<RemoteNasaPicture> remotePictures) async {
    final List<Picture> pictures = [];

    for (var element in remotePictures) {
      try {
        final picture = Picture(
            url: element.url,
            date: element.date,
            explanation: element.explanation,
            hdurl: element.hdurl,
            mediaType: element.mediaType,
            title: element.title,
            copyright: element.copyright,
            encodedBase64ImageFile:
                await _decoder.encodeToBase64(Uri.parse(element.url)),
            encodedBase64ImageHdFile: '');
        pictures.add(picture);
      } on Exception catch (e) {
        _logger.e(e);
      }
    }

    _logger.d("Store pictures: ${pictures.length}");
    return _database.picturesDao.insertPictures(pictures);
  }
}
