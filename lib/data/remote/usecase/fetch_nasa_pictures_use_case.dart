import 'package:astronaut/data/remote/model/nasa_picture/remote_nasa_picture.dart';
import 'package:dio/dio.dart';

import '../nasa_rest_client.dart';

class FetchNasaPicturesUseCase {
  final client = NasaRestClient(Dio());

  Future<List<RemoteNasaPicture>> invoke(
      {required String startDate, required String endDate}) {
    return client.getNasaPictures(startDate: startDate, endDate: endDate);
  }
}
