import 'package:astronaut/data/datasources/local/entity/picture_entity.dart';
import 'package:astronaut/presentation/injection/injector.dart';
import 'package:astronaut/presentation/pages/pictures/picture_presenter.dart';
import 'package:flutter/cupertino.dart';

class PictureItem extends StatefulWidget {
  final Picture picture;

  PictureItem({required this.picture});

  @override
  State<StatefulWidget> createState() {
    return PictureItemState();
  }
}

class PictureItemState extends State<PictureItem> {
  final PicturePresenter _presenter = injector.get<PicturePresenter>();

  @override
  Widget build(BuildContext context) {
    return _getItem();
  }

  Widget _getItem() {
    final bytes =
        _presenter.decodeBase64(widget.picture.encodedBase64ImageFile);
    if (bytes == null) {
      return Text('error');
    }

    return Container(child: Image.memory(bytes));
  }
}
