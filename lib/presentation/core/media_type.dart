class MediaType {
  static const IMAGE = 'image';
  static const VIDEO = 'video';

  static isSupported(String? mediaType) {
    return mediaType == IMAGE;
  }
}
