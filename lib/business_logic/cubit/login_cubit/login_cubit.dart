import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:stucap_admin/data/data.dart';
import 'package:stucap_admin/utils/utils.dart';

import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final AuthRepository _repository = AuthRepository();

  Future login({required String email, required String password}) async{
    try{
      emit(LoginLoading());
      await _repository.login(email: email, password: password);
      emit(LoginLoaded());
    }  on FirebaseAuthException catch(e){
      emit(LoginError(message: AuthExceptionHandler.generateExceptionMessage(e.code)));
    }  catch (e){
      emit(LoginError(message: e.toString()));
    }
  }
}
