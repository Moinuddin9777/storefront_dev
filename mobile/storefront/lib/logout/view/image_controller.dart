import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  File? image;
  void imagePicker() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);
    image = File(pickedImage!.path);
// Capture a photo.
  }
}
