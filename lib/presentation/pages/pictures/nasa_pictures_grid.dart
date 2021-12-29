import 'package:astronaut/data/datasources/remote/model/nasa_picture/remote_nasa_picture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NasaPicturesGrid extends StatelessWidget {
  final List<RemoteNasaPicture> pictures;

  NasaPicturesGrid({required this.pictures});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 2,
        ),
        itemCount: pictures.length,
        itemBuilder: (context, index) {
          return new GestureDetector(
              onTap: () {
                //todo
              },
              child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(pictures[index].url ?? ""),
              ))));
        });
  }
}
