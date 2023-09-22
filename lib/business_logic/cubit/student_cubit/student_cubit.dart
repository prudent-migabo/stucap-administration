import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stucap_admin/data/data.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentState.initial()) {
    getStudentsMonitor();
  }

  StreamSubscription? subscription;

  StreamSubscription<List<StudentModel>> getStudentsMonitor() {
    return subscription =
        StudentsRepository().getListStudents().listen((event) {
      emit(state.copyWith(students: event));
    });
  }

  void initial (){
    emit(StudentState.initial());
  }

  Future<void> createStudent(StudentModel studentModel) async {
    try {
      emit(state.copyWith(studentStatus: StudentStatus.submitting));
      String result =
          await StudentsRepository().addStudent(studentModel.toMap());
      emit(state.copyWith(
          studentStatus: StudentStatus.submitted, studentID: result));
    } catch (e) {
      emit(state.copyWith(
          studentStatus: StudentStatus.error, error: e.toString()));
    }
  }

  Future<void> updateStudent(String studentID) async {
    try {
      emit(state.copyWith(studentStatus: StudentStatus.submitting));
      String result =
          await StudentsRepository().updatePresenceStatus(studentID);
      emit(state.copyWith(studentStatus: StudentStatus.submitted));
    } catch (e) {
      emit(state.copyWith(
          studentStatus: StudentStatus.error, error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    subscription!.cancel();
    return super.close();
  }
}
