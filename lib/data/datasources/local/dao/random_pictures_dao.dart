import 'package:astronaut/data/datasources/local/entity/random_picture.dart';
import 'package:floor/floor.dart';

@dao
abstract class RandomPicturesDao {
  @Query('SELECT * FROM RandomPictures')
  Future<List<RandomPicture>> getPictures();

  @Query('SELECT * FROM RandomPictures WHERE url = :url')
  Stream<RandomPicture?> findPictureByUrl(String url);

  @insert
  Future<void> insertPicture(RandomPicture picture);

  @insert
  Future<void> insertPictures(List<RandomPicture> picture);

  @delete
  Future<void> deletePicture(RandomPicture picture);

  @Query("DELETE * FROM RandomPictures")
  Future<void> clear();
}
