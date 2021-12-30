import 'package:astronaut/data/datasources/local/entity/random_picture.dart';
import 'package:astronaut/domain/repositories/random_pictures_repository.dart';

class GetRandomPicturesUseCase {
  final RandomPicturesRepository _repository;

  GetRandomPicturesUseCase(this._repository);

  Future<List<RandomPicture>> invoke() {
    return _repository.getSavedPictures() ?? Future.value([]);
  }
}
