import 'package:astronaut/data/datasources/remote/model/nasa_picture/remote_nasa_picture.dart';
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
        builder: (context, List<RemoteNasaPicture> pictures, widget) {
          return MediaGrid(pictures: pictures);
        });
  }

  @override
  void dispose() {
    picturesPresenter.dispose();
    super.dispose();
  }
}
