import 'package:astronaut/data/datasources/remote/model/nasa_picture/remote_nasa_picture.dart';
import 'package:astronaut/data/datasources/remote/state/request_state.dart';
import 'package:astronaut/domain/repositories/pictures_repository.dart';

class FetchNasaPicturesUseCase {
  final PicturesRepository _repository;

  FetchNasaPicturesUseCase(this._repository);

  Future<RequestState<List<RemoteNasaPicture>>> invoke(
      {required String startDate, required String endDate}) async {
    return _repository.getNasaPictures(startDate: startDate, endDate: endDate);
  }
}
