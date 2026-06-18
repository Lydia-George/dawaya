import 'dart:ffi';

import 'package:dawaya/data/repositories/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repo;

  AuthCubit(this._repo) : super(AuthInit());



  Future<void> register(String email, String password) async {
    emit(AuthLoading());
    try {
      await _repo.register(email, password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> resetPassword(String email) async {
    emit(AuthLoading());
    try {
      await _repo.resetPassword(email);
      emit(PasswordResetEmailSent());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void toggleRememberMe(bool? value) {
    emit(state.copyWith(rememberMe: value ?? false));
  }

  // read the current saved value when screen open
  Future<void> loadSavedEmail() async{
    final prefs = await SharedPreferences.getInstance();
    final remembered = prefs.getBool('remember_me') ?? false;
    if(remembered){
      final savedEmail = prefs.getString('saved_email');
      emit(state.copyWith(rememberMe: true, savedEmail: savedEmail));
    }
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoading());

    try {
      await _repo.login(email, password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

}
