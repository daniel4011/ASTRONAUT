import 'package:astronaut/data/datasources/remote/model/nasa_picture/remote_nasa_picture.dart';
import 'package:astronaut/data/datasources/remote/state/request_state.dart';
import 'package:astronaut/domain/repositories/pictures_repository.dart';

class FetchRandomNasaPicturesUseCase {
  final PicturesRepository _repository;

  FetchRandomNasaPicturesUseCase(this._repository);

  Future<RequestState<List<RemoteNasaPicture>>> invoke(
      {required int count}) async {
    return _repository.getRandomNasaPictures(count: count);
  }
}
