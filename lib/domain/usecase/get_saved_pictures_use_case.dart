import 'package:astronaut/data/datasources/local/entity/picture_entity.dart';
import 'package:astronaut/domain/repositories/pictures_repository.dart';

class GetSavedPicturesUseCase {
  final PicturesRepository _repository;

  GetSavedPicturesUseCase(this._repository);

  Future<List<Picture>> invoke() {
    return _repository.getSavedNasaPictures() ?? Future.value([]);
  }
}
