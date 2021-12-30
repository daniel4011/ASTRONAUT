import 'package:floor/floor.dart';

@entity
class Picture {
  @primaryKey
  final String url;

  final String? date;
  final String? explanation;
  final String? hdurl;
  final String? mediaType;
  final String? title;
  final String? copyright;

  final String encodedBase64ImageFile;
  final String encodedBase64ImageHdFile;

  Picture(
      {required this.url,
      required this.date,
      required this.explanation,
      required this.hdurl,
      required this.mediaType,
      required this.title,
      required this.copyright,
      required this.encodedBase64ImageFile,
      required this.encodedBase64ImageHdFile});
}
