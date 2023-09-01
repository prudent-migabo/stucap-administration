import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_list_students_state.dart';

class HomeListStudentsCubit extends Cubit<HomeListStudentsState> {
  HomeListStudentsCubit() : super(HomeListStudentsState.initial());

  void getDetails (int index, bool isClicked){
    emit(state.copyWith(index: index, isClicked: isClicked),);
  }

  int returnIndex (int index){
    return index;
  }
}
