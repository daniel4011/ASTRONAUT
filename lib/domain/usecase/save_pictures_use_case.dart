import 'package:astronaut/data/datasources/local/entity/picture_entity.dart';
import 'package:astronaut/domain/repositories/pictures_repository.dart';

class SavePicturesUseCase {
  final PicturesRepository _repository;

  SavePicturesUseCase(this._repository);

  invoke(List<Picture> entities) {
    _repository.insertPictures(entities);
  }
}
