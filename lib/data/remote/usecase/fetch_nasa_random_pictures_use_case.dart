import 'package:astronaut/data/remote/model/nasa_picture/remote_nasa_picture.dart';
import 'package:dio/dio.dart';

import '../nasa_rest_client.dart';

class FetchRandomNasaPicturesUseCase {
  final client = NasaRestClient(Dio());

  Future<List<RemoteNasaPicture>> invoke({required int count}) {
    return client.getRandomNasaPictures(count: count);
  }
}
