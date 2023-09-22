import 'dart:io';

import 'package:stucap_admin/utils/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  ImagesCubit() : super(ImagesState.initial());

  Future getStudentImgUrl (File? pickedImage) async {
    try {
      emit(state.copyWith(imagesStatus: ImagesStatus.loading));
      if (pickedImage != null){
        final ref = FirebaseStorage.instance.ref().child('student-images').child(pickedImage.path);
        await ref.putFile(pickedImage);
        String url = await ref.getDownloadURL();
        emit(state.copyWith(imagesStatus: ImagesStatus.loaded, studentImage: url),);
      }
    } on FirebaseException catch(e){
      emit(state.copyWith(imagesStatus: ImagesStatus.error, error: AuthExceptionHandler.generateExceptionMessage(e.code),),);
    } catch(e){
      emit(state.copyWith(imagesStatus: ImagesStatus.error, error: e.toString()));
    }
  }


  Future getUserImgUrl (File? pickedImage) async {
    try {
      emit(state.copyWith(imagesStatus: ImagesStatus.loading));
      if (pickedImage != null){
        final ref = FirebaseStorage.instance.ref().child(FirebaseAuth.instance.currentUser!.uid).child(pickedImage.path);
        await ref.putFile(pickedImage);
        String url = await ref.getDownloadURL();
        emit(state.copyWith(imagesStatus: ImagesStatus.loaded, studentImage: url),);
      }
    } on FirebaseException catch(e){
      emit(state.copyWith(imagesStatus: ImagesStatus.error, error: AuthExceptionHandler.generateExceptionMessage(e.code)));
    } catch(e){
      emit(state.copyWith(imagesStatus: ImagesStatus.error, error: e.toString()));
    }
  }

}
