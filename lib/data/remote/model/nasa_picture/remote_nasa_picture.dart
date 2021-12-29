import 'package:json_annotation/json_annotation.dart';

import '../remote_data_model.dart';

part 'remote_nasa_picture.g.dart';

@JsonSerializable()
class RemoteNasaPicture extends RemoteDataModel {
  RemoteNasaPicture({
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.serviceVersion,
    required this.title,
    required this.url,
  });

  late final String date;
  late final String explanation;
  late final String hdurl;
  late final String mediaType;
  late final String serviceVersion;
  late final String title;
  late final String url;

  factory RemoteNasaPicture.fromJson(Map<String, dynamic> json) =>
      _$RemoteNasaPictureFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteNasaPictureToJson(this);
}
