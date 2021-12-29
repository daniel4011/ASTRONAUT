import 'package:astronaut/data/datasources/remote/model/nasa_picture/remote_nasa_picture.dart';
import 'package:flutter/cupertino.dart';

class PictureItem extends StatefulWidget {
  final RemoteNasaPicture picture;

  PictureItem({required this.picture});

  @override
  State<StatefulWidget> createState() {
    return PictureItemState();
  }
}

class PictureItemState extends State<PictureItem> {
  @override
  Widget build(BuildContext context) {
    print("url: ${widget.picture.url}");
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(widget.picture.url))));
  }
}
