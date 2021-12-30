import 'package:astronaut/data/datasources/local/entity/picture_entity.dart';
import 'package:astronaut/domain/repositories/pictures_repository.dart';

class RemovePictureUseCase {
  final PicturesRepository _repository;

  RemovePictureUseCase(this._repository);

  invoke(Picture entity) {
    _repository.deletePicture(entity);
  }
}
