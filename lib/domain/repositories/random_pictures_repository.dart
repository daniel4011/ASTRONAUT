import 'package:astronaut/data/datasources/local/entity/random_picture.dart';
import 'package:astronaut/data/datasources/remote/state/request_state.dart';

abstract class RandomPicturesRepository {
  Future<RequestState<List<RandomPicture>>> fetchNasaRandomPictures(
      {required int count});

  Future<List<RandomPicture>>? getSavedPictures();

  Future<void> insertPicture(RandomPicture entity);

  Future<void> insertPictures(List<RandomPicture> entities);

  Future<void> deletePicture(RandomPicture entity);

  Future<void> deleteAllPictures();
}
