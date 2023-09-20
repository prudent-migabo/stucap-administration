import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stucap_admin/business_logic/business_logic.dart';
import 'package:stucap_admin/data/data.dart';

class AuthStreamCubit extends Cubit<AuthStreamState> {
  AuthStreamCubit() : super(AuthStreamState.initial()){
    monitorAuthStreamCubit();
  }

  StreamSubscription? subscription;

  StreamSubscription<User?> monitorAuthStreamCubit (){
  return subscription = AuthRepository().user.listen((user) {
    onUserStatusChanged(user);
  });
  }

  void onUserStatusChanged (User? user) {
    if (user != null) {
      emit(state.copyWith(userAuthStatus: UserAuthStatus.authenticated));
    } else {
      emit(state.copyWith(userAuthStatus: UserAuthStatus.unauthenticated));
    }
  }

  @override
  Future<void> close() {
    subscription!.cancel();
    return super.close();
  }

}
