import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'api_constants.dart';
import 'model/nasa_picture/remote_nasa_picture.dart';

part 'nasa_rest_client.g.dart';

//Generate models with 'flutter pub run build_runner build --delete-conflicting-outputs' command.
@RestApi(baseUrl: ApiConstants.BASE_URL)
abstract class NasaRestClient {
  factory NasaRestClient(Dio dio, {String baseUrl}) = _NasaRestClient;

  @GET("/planetary/apod")
  Future<HttpResponse<List<RemoteNasaPicture>>> getNasaPictures({
    @Query("api_key") String apiKey = ApiConstants.API_KEY,
    @Query("start_date") required String startDate,
    @Query("end_date") required String endDate,
    @Query("thumbs") bool thumbs = true,
  });

  @GET("/planetary/apod")
  Future<HttpResponse<List<RemoteNasaPicture>>> getRandomNasaPictures({
    @Query("api_key") String apiKey = ApiConstants.API_KEY,
    @Query("count") required int count,
    @Query("thumbs") bool thumbs = true,
  });
}
