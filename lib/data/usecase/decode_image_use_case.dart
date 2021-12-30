import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

class DecodeImageUseCase {
  final Base64Codec _codec;

  DecodeImageUseCase(this._codec);

  Future<String> encodeToBase64(Uri imageUri) async {
    http.Response response = await http.get(imageUri);
    final base64 = _codec.encode(response.bodyBytes);
    print("Decoded $imageUri to base64 string with length: ${base64.length}");
    return base64;
  }

  Uint8List? decodeBase64(String base64) {
    return _codec.decode(base64);
  }
}
