import 'package:astronaut/domain/repositories/pictures_repository.dart';

class ClearPicturesUseCase {
  final PicturesRepository _repository;

  ClearPicturesUseCase(this._repository);

  invoke() {
    _repository.clearPictures();
  }
}
