import 'package:astronaut/data/datasources/remote/model/nasa_picture/remote_nasa_picture.dart';
import 'package:astronaut/data/datasources/remote/state/request_state.dart';

abstract class PicturesRepository {
  Future<RequestState<List<RemoteNasaPicture>>> getNasaPictures(
      {required String startDate, required String endDate});

  Future<RequestState<List<RemoteNasaPicture>>> getRandomNasaPictures(
      {required int count});
}
