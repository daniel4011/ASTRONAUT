import 'package:json_annotation/json_annotation.dart';

part 'remote_nasa_picture.g.dart';

@JsonSerializable()
class RemoteNasaPicture {
  RemoteNasaPicture({
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.serviceVersion,
    required this.title,
    required this.url,
  });

  final String? date;
  final String? explanation;
  final String? hdurl;
  final String? mediaType;
  final String? serviceVersion;
  final String? title;
  final String? url;

  factory RemoteNasaPicture.fromJson(Map<String, dynamic> json) =>
      _$RemoteNasaPictureFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteNasaPictureToJson(this);
}
