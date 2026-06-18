
import 'package:dawaya/data/repositories/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repo;
  AuthCubit(this._repo) : super (AuthInit());

  Future<void> login(String email , String password) async{
    emit(AuthLoading());

    try{
      await _repo.login(email, password);
      emit(AuthSuccess());
    }catch(e){
      emit(AuthError(e.toString()));
    }

  }


  Future<void> register (String email , String password) async{
    emit(AuthLoading());
    try{
      await _repo.register(email, password);
      emit(AuthSuccess());
    }catch(e){
      emit(AuthError(e.toString()));

    }

  }


}
