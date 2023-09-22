import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stucap_admin/config/theming.dart';
import 'package:stucap_admin/presentation/presentation.dart';

class StateProfilePhotoLoader extends StatelessWidget {
  const StateProfilePhotoLoader({Key? key, this.pickedImage}) : super(key: key);
   final File? pickedImage;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomAvatarImage(radius: 80, imageProvider: FileImage(File(pickedImage!.path),),),
        CircleAvatar(
          radius: 80,
          backgroundColor: AppThemeData.backgroundBlack.withOpacity(0.7),
          child: const CircularProgressIndicator(
            color: AppThemeData.backgroundWhite,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: InkWell(
            onTap: (){},
            child: const Icon(Icons.camera_alt, size: 30, color: AppThemeData.primaryColor,),),),
      ],
    );
  }
}
