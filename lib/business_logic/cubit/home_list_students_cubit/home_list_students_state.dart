part of 'home_list_students_cubit.dart';

abstract class HomeListStudentsStateSuper extends Equatable {}

class HomeListStudentsState extends HomeListStudentsStateSuper {
  final int index;
  final bool isClicked;

  @override
  // TODO: implement props
  List<Object?> get props => [index, isClicked];

  HomeListStudentsState({
    required this.index,
    required this.isClicked,
  });


  HomeListStudentsState copyWith({
    int? index,
    bool? isClicked,
  }) {
    return HomeListStudentsState(
      index: index ?? this.index,
      isClicked: isClicked ?? false,
    );
  }


  factory HomeListStudentsState.initial() {
    return HomeListStudentsState(
      index: 0,
      isClicked: false,
    );
  }

//</editor-fold>
}
