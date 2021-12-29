// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_nasa_picture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteNasaPicture _$RemoteNasaPictureFromJson(Map<String, dynamic> json) =>
    RemoteNasaPicture(
      date: json['date'] as String?,
      explanation: json['explanation'] as String?,
      hdurl: json['hdurl'] as String?,
      mediaType: json['media_type'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String,
      copyright: json['copyright'] as String?,
    );

Map<String, dynamic> _$RemoteNasaPictureToJson(RemoteNasaPicture instance) =>
    <String, dynamic>{
      'date': instance.date,
      'explanation': instance.explanation,
      'hdurl': instance.hdurl,
      'media_type': instance.mediaType,
      'title': instance.title,
      'url': instance.url,
      'copyright': instance.copyright,
    };
