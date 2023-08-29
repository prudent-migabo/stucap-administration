part of 'home_filter_logic_cubit.dart';

 enum HomeFilterLogicStatus {
  index1,
  index2,
  index3,
  index4,
  index5,
   index6,
 }
abstract class HomeFilterLogicStateSuper extends Equatable{}

class HomeFilterLogicState extends HomeFilterLogicStateSuper {

  HomeFilterLogicStatus homeFilterLogicStatus;
  int? index;



  @override
  // TODO: implement props
  List<Object?> get props => [homeFilterLogicStatus, index];

//<editor-fold desc="Data Methods">
  HomeFilterLogicState({
    required this.homeFilterLogicStatus,
    this.index,
  });


  HomeFilterLogicState copyWith({
    HomeFilterLogicStatus? homeFilterLogicStatus,
    int? index,
  }) {
    return HomeFilterLogicState(
      homeFilterLogicStatus:
          homeFilterLogicStatus ?? this.homeFilterLogicStatus,
      index: index ?? this.index,
    );
  }


  factory HomeFilterLogicState.initial() {
    return HomeFilterLogicState(
      homeFilterLogicStatus: HomeFilterLogicStatus.index1,
      index: 1,
    );
  }

//</editor-fold>
}
