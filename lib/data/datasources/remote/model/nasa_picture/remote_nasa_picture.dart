import 'package:json_annotation/json_annotation.dart';

part 'remote_nasa_picture.g.dart';

@JsonSerializable()
class RemoteNasaPicture {
  final String? date;
  final String? explanation;
  final String? hdurl;
  @JsonKey(name: 'media_type')
  final String? mediaType;
  final String? title;
  final String url;
  final String? copyright;

  RemoteNasaPicture({
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.title,
    required this.url,
    required this.copyright,
  });

  factory RemoteNasaPicture.fromJson(Map<String, dynamic> json) =>
      _$RemoteNasaPictureFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteNasaPictureToJson(this);
}
