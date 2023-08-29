import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_filter_logic_state.dart';

class HomeFilterLogicCubit extends Cubit<HomeFilterLogicState> {
  HomeFilterLogicCubit() : super(HomeFilterLogicState.initial());

  void emitterIndex1 (){
    emit(state.copyWith(homeFilterLogicStatus: HomeFilterLogicStatus.index1, index: 1));
  }

  void emitterIndex2 (){
    emit(state.copyWith(homeFilterLogicStatus: HomeFilterLogicStatus.index2, index: 2));
  }

  void emitterIndex3 (){
    emit(state.copyWith(homeFilterLogicStatus: HomeFilterLogicStatus.index3, index: 3));
  }

  void emitterIndex4 (){
    emit(state.copyWith(homeFilterLogicStatus: HomeFilterLogicStatus.index4, index: 4));
  }

  void emitterIndex5 (){
    emit(state.copyWith(homeFilterLogicStatus: HomeFilterLogicStatus.index5, index: 5));
  }

  void emitterIndex6 (){
    emit(state.copyWith(homeFilterLogicStatus: HomeFilterLogicStatus.index6, index: 6));
  }

}
