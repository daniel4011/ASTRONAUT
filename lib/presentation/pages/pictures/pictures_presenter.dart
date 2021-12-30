import 'package:astronaut/data/datasources/local/entity/picture_entity.dart';
import 'package:astronaut/domain/usecase/fetch_nasa_pictures_use_case.dart';
import 'package:astronaut/domain/usecase/get_saved_pictures_use_case.dart';
import 'package:astronaut/presentation/core/constants.dart';
import 'package:astronaut/presentation/injection/injector.dart';
import 'package:astronaut/presentation/utils/app_date_utils.dart';
import 'package:flutter/material.dart';

abstract class PicturesPresenter {
  ValueNotifier<List<Picture>> pictures();

  dispose();
}

class PicturesPresenterImpl implements PicturesPresenter {
  PicturesPresenterImpl() {
    populateSavePictures();
  }

  var _getSavePicturesUseCase = injector.get<GetSavedPicturesUseCase>();
  var _fetchPicturesUseCase = injector.get<FetchNasaPicturesUseCase>();

  final ValueNotifier<List<Picture>> _pictures = ValueNotifier([]);

  @override
  ValueNotifier<List<Picture>> pictures() {
    return _pictures;
  }

  @override
  dispose() {
    _pictures.dispose();
  }

  populateSavePictures() async {
    final savePictures = await _getSavePicturesUseCase.invoke();
    if (savePictures.isEmpty) {
      final currentDate = AppDateUtils.getCurrentDate();
      await _fetchPicturesUseCase.invoke(
          startDate: AppDateUtils.format(currentDate.subtract(
              Duration(days: Constants.PICTURES_PAGINATION_DATE_SUBTRACTION))),
          endDate: AppDateUtils.format(currentDate));
    }
    _pictures.value = savePictures;
  }
}
