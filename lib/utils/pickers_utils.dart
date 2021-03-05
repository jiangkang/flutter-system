import 'dart:io';

import 'package:image_picker/image_picker.dart';

class Pickers {
  static Future<File> pickImageFromGallery() async {
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    return File(pickedFile.path);
  }

  static Future<File> pickImageFromCamera() async {
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.camera);
    return File(pickedFile.path);
  }

  static Future<File> pickVideoFromGallery() async {
    final pickedFile = await ImagePicker.pickVideo(source: ImageSource.gallery);
    return File(pickedFile.path);
  }

  static Future<File> pickVideoFromCamera() async {
    final pickedFile = await ImagePicker.pickVideo(source: ImageSource.camera);
    return File(pickedFile.path);
  }
}
