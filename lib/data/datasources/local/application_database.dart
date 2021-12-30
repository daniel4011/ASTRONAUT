import 'dart:async';

import 'package:astronaut/data/datasources/local/dao/pictures_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/random_pictures_dao.dart';
import 'entity/picture_entity.dart';
import 'entity/random_picture.dart';

part 'application_database.g.dart';

@Database(version: 2, entities: [Picture, RandomPicture])
abstract class ApplicationDatabase extends FloorDatabase {
  PicturesDao get picturesDao;
  RandomPicturesDao get randomPicturesDao;
}
