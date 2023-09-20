import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stucap_admin/data/data.dart';
import 'package:stucap_admin/utils/utils.dart';
import 'logout_state.dart';


class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  final AuthRepository _repository = AuthRepository();

  Future logout() async{
    try{
      emit(LogoutLoading());
     await _repository.logout();
      emit(LogoutLoaded());
    }  on FirebaseAuthException catch(e){
      emit(LogoutError(message: AuthExceptionHandler.generateExceptionMessage(e.code)));
    }  catch (e){
      emit(LogoutError(message: e.toString()));
    }
  }

}
