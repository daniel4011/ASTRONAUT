import 'package:astronaut/data/datasources/local/entity/picture_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class PicturesDao {
  @Query('SELECT * FROM Picture')
  Future<List<Picture>> getPictures();

  @Query('SELECT * FROM Picture WHERE url = :url')
  Stream<Picture?> findPictureByUrl(String url);

  @insert
  Future<void> insertPicture(Picture picture);

  @insert
  Future<void> insertPictures(List<Picture> picture);

  @delete
  Future<void> deletePicture(Picture picture);

  @Query("DELETE FROM Picture")
  Future<void> clear();
}
