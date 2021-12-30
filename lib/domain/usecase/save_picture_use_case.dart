import 'package:astronaut/data/datasources/local/entity/picture_entity.dart';
import 'package:astronaut/domain/repositories/pictures_repository.dart';

class SavePictureUseCase {
  final PicturesRepository _repository;

  SavePictureUseCase(this._repository);

  invoke(Picture entity) {
    _repository.insertPicture(entity);
  }
}
