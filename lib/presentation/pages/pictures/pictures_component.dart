import 'package:astronaut/data/datasources/local/entity/picture_entity.dart';
import 'package:astronaut/presentation/pages/pictures/media_grid.dart';
import 'package:flutter/cupertino.dart';

import 'pictures_presenter.dart';

class PicturesComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PicturesState();
  }
}

class PicturesState extends State<PicturesComponent> {
  final PicturesPresenter picturesPresenter = PicturesPresenterImpl();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: picturesPresenter.pictures(),
        builder: (context, List<Picture> pictures, widget) {
          return MediaGrid(pictures: pictures);
        });
  }

  @override
  void dispose() {
    picturesPresenter.dispose();
    super.dispose();
  }
}
