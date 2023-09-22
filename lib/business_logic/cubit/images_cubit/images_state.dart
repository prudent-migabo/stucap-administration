part of 'images_cubit.dart';

enum ImagesStatus {
  initial,
  loading,
  loaded,
  error
}

class ImagesState extends Equatable{
  @override
  List<Object?> get props => [imagesStatus, studentImage, error];

  ImagesStatus imagesStatus;
  String studentImage;
  String error;

//<editor-fold desc="Data Methods">
  ImagesState({
    required this.imagesStatus,
    required this.studentImage,
    required this.error,
  });

  ImagesState copyWith({
    ImagesStatus? imagesStatus,
    String? studentImage,
    String? error,
  }) {
    return ImagesState(
      imagesStatus: imagesStatus ?? this.imagesStatus,
      studentImage: studentImage ?? this.studentImage,
      error: error ?? this.error,
    );
  }

  factory ImagesState.initial() {
    return ImagesState(
      imagesStatus: ImagesStatus.initial,
      studentImage: '',
      error: '',
    );
  }
}
