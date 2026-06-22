import 'package:dawaya/data/repositories/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repo;

  AuthCubit(this._repo) : super(AuthState());


  /// -- LOG IN
  Future<void> login(String email, String password) async {
    emit(state.copyWith(isLoading: true));

    try {
      await _repo.login(email, password);

      final prefs = await SharedPreferences.getInstance();
      if(state.rememberMe){
        await prefs.setString('saved_email', email);
        await prefs.setBool('remember_me', true);
      }
      else{
        await prefs.remove('saved_email');
        await prefs.setBool('remember_me' , false);
      }

      emit(state.copyWith(isSuccess: true));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  /// -- REGISTER
  Future<void> register(String email, String password) async {
    emit(state.copyWith(isLoading: true));
    try {
      await _repo.register(email, password);
      emit(state.copyWith(isSuccess: true));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  /// -- RESET PASSWORD
  Future<void> resetPassword(String email) async {
    emit(state.copyWith(isLoading: true));
    try {
      await _repo.resetPassword(email);
      emit(state.copyWith(isPasswordResetSent: true));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  /// -- TOGGLE REMEMBER ME CHECK BOX
  void toggleRememberMe(bool? value) {
    emit(state.copyWith(rememberMe: value ?? false));
  }

  /// -- LOAD THE SAVED VALUE
  // read the current saved value when screen open
  Future<void> loadSavedEmail() async{
    final prefs = await SharedPreferences.getInstance();
    final remembered = prefs.getBool('remember_me') ?? false;
    if(remembered){
      final savedEmail = prefs.getString('saved_email');
      emit(state.copyWith(rememberMe: true, savedEmail: savedEmail));
    }
  }


  /// -- LOGOUT
  Future<void> logout() async{
    emit(AuthState()); // return initial value of state
  }


}
