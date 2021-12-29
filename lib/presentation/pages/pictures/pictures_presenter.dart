import 'package:astronaut/data/datasources/remote/model/nasa_picture/remote_nasa_picture.dart';
import 'package:astronaut/domain/repositories/pictures_repository.dart';
import 'package:astronaut/presentation/injection/injector.dart';
import 'package:flutter/cupertino.dart';

abstract class PicturesPresenter {
  ValueNotifier<List<RemoteNasaPicture>> pictures();

  dispose();
}

class PicturesPresenterImpl implements PicturesPresenter {
  PicturesPresenterImpl() {
    fetchPictures();
  }

  var repository = injector.get<PicturesRepository>();

  final ValueNotifier<List<RemoteNasaPicture>> _pictures = ValueNotifier([]);

  @override
  ValueNotifier<List<RemoteNasaPicture>> pictures() {
    return _pictures;
  }

  @override
  dispose() {
    _pictures.dispose();
  }

  fetchPictures() async {
    final pictures = await repository.getNasaPictures(
        startDate: "2021-01-01", endDate: "2021-01-10");
    if (pictures.responseData != null) {
      _pictures.value = pictures.responseData ?? [];
    }
  }
}
