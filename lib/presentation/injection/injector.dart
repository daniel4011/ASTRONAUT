import 'dart:convert';

import 'package:astronaut/data/datasources/local/application_database.dart';
import 'package:astronaut/data/datasources/remote/nasa_rest_client.dart';
import 'package:astronaut/data/repositories/pictures_repository_impl.dart';
import 'package:astronaut/data/repositories/random_pictures_repository_impl.dart';
import 'package:astronaut/data/usecase/decode_image_use_case.dart';
import 'package:astronaut/domain/repositories/pictures_repository.dart';
import 'package:astronaut/domain/repositories/random_pictures_repository.dart';
import 'package:astronaut/domain/usecase/clear_pictures_use_case.dart';
import 'package:astronaut/domain/usecase/fetch_nasa_pictures_use_case.dart';
import 'package:astronaut/domain/usecase/fetch_nasa_random_pictures_use_case.dart';
import 'package:astronaut/domain/usecase/get_random_pictures_use_case.dart';
import 'package:astronaut/domain/usecase/get_saved_pictures_use_case.dart';
import 'package:astronaut/domain/usecase/remove_picture_use_case.dart';
import 'package:astronaut/domain/usecase/save_picture_use_case.dart';
import 'package:astronaut/domain/usecase/save_pictures_use_case.dart';
import 'package:astronaut/presentation/pages/pictures/picture_presenter.dart';
import 'package:dio/dio.dart';
import 'package:floor/floor.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  //logger
  injector.registerSingleton<Logger>(Logger());

  //database
  injector
      .registerSingleton<ApplicationDatabase>(await $FloorApplicationDatabase
          .databaseBuilder('application_database.db')
          .addCallback(Callback(onCreate: (database, version) {
            injector.get<Logger>().d("Database created. Version: $version");
          }, onOpen: (database) {
            injector.get<Logger>().d("Database opened.");
          }, onUpgrade: (database, startVersion, endVersion) {
            injector
                .get<Logger>()
                .w("Database upgraded from $startVersion to $endVersion.");
          }))
          .build());

  //dio
  injector.registerSingleton<Dio>(Dio());

  //nasa rest client
  injector.registerSingleton<NasaRestClient>(NasaRestClient(injector()));

  //codec
  injector.registerSingleton<Base64Codec>(Base64Codec());

  injector
      .registerSingleton<DecodeImageUseCase>(DecodeImageUseCase(injector()));

  //repositories
  injector.registerSingleton<PicturesRepository>(
      PicturesRepositoryImpl(injector(), injector(), injector(), injector()));
  injector.registerSingleton<RandomPicturesRepository>(
      RandomPicturesRepositoryImpl(injector(), injector(), injector()));

  //use case's
  injector.registerSingleton(FetchNasaPicturesUseCase(injector()));
  injector.registerSingleton(FetchRandomNasaPicturesUseCase(injector()));
  injector.registerSingleton(ClearPicturesUseCase(injector()));
  injector.registerSingleton(RemovePictureUseCase(injector()));
  injector.registerSingleton(SavePictureUseCase(injector()));
  injector.registerSingleton(SavePicturesUseCase(injector()));
  injector.registerSingleton(GetSavedPicturesUseCase(injector()));
  injector.registerSingleton(GetRandomPicturesUseCase(injector()));

  //presenters
  injector
      .registerSingleton<PicturePresenter>(PicturePresenterImpl(injector()));
}
