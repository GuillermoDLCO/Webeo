import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MediaService {
  final picker = ImagePicker();

  Future<PickedFile> getImage({bool fromGallery = true}) {
    return picker.getImage(source: fromGallery ? ImageSource.gallery : ImageSource.camera);
  }

  Future<String> getBase64FromFile(File pickedImageFile) async {
    return base64String(await pickedImageFile.readAsBytes());
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  String base64String(Uint8List data) {
    return base64Encode(data);
  }

  Future<File> exIf({@required path}) async {
    ImageProperties properties;
    if (Platform.isAndroid) {
      File image = await FlutterExifRotation.rotateImage(path: path);
      properties = await FlutterNativeImage.getImageProperties(image.path);
    } else
      properties = await FlutterNativeImage.getImageProperties(path);
    return await FlutterNativeImage.compressImage(
      path,
      quality: 90,
      targetWidth: 410,
      targetHeight: (properties.height * 410 / properties.width).round(),
    );
  }
}
