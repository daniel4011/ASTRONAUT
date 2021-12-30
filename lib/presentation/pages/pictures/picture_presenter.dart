import 'dart:typed_data';

import 'package:astronaut/data/usecase/decode_image_use_case.dart';

abstract class PicturePresenter {
  Uint8List? decodeBase64(String base64);
}

class PicturePresenterImpl extends PicturePresenter {
  final DecodeImageUseCase _useCase;

  PicturePresenterImpl(this._useCase);

  @override
  Uint8List? decodeBase64(String base64) {
    return _useCase.decodeBase64(base64);
  }
}
