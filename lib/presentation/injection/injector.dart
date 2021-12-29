import 'package:astronaut/data/datasources/remote/nasa_rest_client.dart';
import 'package:astronaut/data/repositories/pictures_repository_impl.dart';
import 'package:astronaut/domain/repositories/pictures_repository.dart';
import 'package:astronaut/domain/usecase/get_nasa_pictures_use_case.dart';
import 'package:astronaut/domain/usecase/get_nasa_random_pictures_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  //dio
  injector.registerSingleton<Dio>(Dio());

  //nasa rest client
  injector.registerSingleton<NasaRestClient>(NasaRestClient(injector()));

  //repositories
  injector.registerSingleton<PicturesRepository>(
      PicturesRepositoryImpl(injector()));

  //use case's
  injector.registerSingleton<FetchNasaPicturesUseCase>(
      FetchNasaPicturesUseCase(injector()));
  injector.registerSingleton<FetchRandomNasaPicturesUseCase>(
      FetchRandomNasaPicturesUseCase(injector()));
}
