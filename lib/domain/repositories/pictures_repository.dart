import 'package:astronaut/data/datasources/local/entity/picture_entity.dart';
import 'package:astronaut/data/datasources/remote/model/nasa_picture/remote_nasa_picture.dart';
import 'package:astronaut/data/datasources/remote/state/request_state.dart';

abstract class PicturesRepository {
  Future<RequestState<List<RemoteNasaPicture>>> fetchNasaPictures(
      {required String startDate, required String endDate});

  Future<List<Picture>>? getSavedNasaPictures();

  Future<void> insertPicture(Picture entity);

  Future<void> insertPictures(List<Picture> entities);

  Future<void> deletePicture(Picture entity);

  Future<void> clearPictures();
}
