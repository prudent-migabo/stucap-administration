// Date picker method
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

DateTime date = DateTime.now();

pickDate (BuildContext context) async{
  DateTime? newDate = await showDatePicker(
    context: context,
    initialDate: date,
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );
  if (newDate == null) return;
  return newDate;
}


// Image picker method
final ImagePicker _picker = ImagePicker();

File? _image;

getImageFromGallery() async{
    XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final temporaryImage = File(pickedImage.path);
      _image = temporaryImage;
      return _image;
    }
  }

  Uint8List _webImage = Uint8List(8);
  getWebImage () async{
    XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final temporaryImage = await pickedImage.readAsBytes();
      _webImage = temporaryImage;
      return _webImage;
    }
}

// web image picker

