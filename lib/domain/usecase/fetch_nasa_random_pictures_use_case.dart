import 'package:astronaut/data/datasources/local/entity/random_picture.dart';
import 'package:astronaut/data/datasources/remote/state/request_state.dart';
import 'package:astronaut/domain/repositories/random_pictures_repository.dart';

class FetchRandomNasaPicturesUseCase {
  final RandomPicturesRepository _repository;

  FetchRandomNasaPicturesUseCase(this._repository);

  Future<RequestState<List<RandomPicture>>> invoke({required int count}) async {
    return _repository.fetchNasaRandomPictures(count: count);
  }
}
