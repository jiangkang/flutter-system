import 'dart:io';

import 'package:image_picker/image_picker.dart';

class Pickers {
  static Future<File> pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    return File(pickedFile.path);
  }

  static Future<File> pickImageFromCamera() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    return File(pickedFile.path);
  }

  static Future<File> pickVideoFromGallery() async {
    final pickedFile =
        await ImagePicker().getVideo(source: ImageSource.gallery);
    return File(pickedFile.path);
  }

  static Future<File> pickVideoFromCamera() async {
    final pickedFile = await ImagePicker().getVideo(source: ImageSource.camera);
    return File(pickedFile.path);
  }
}
