import 'package:dawaya/data/repositories/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repo;

  AuthCubit(this._repo) : super(AuthState());

  void onFullNameChanged(String value) => emit(state.copyWith(fullName: value));
  void onEmailChanged(String value) => emit(state.copyWith(email: value));
  void onPasswordChanged(String value) => emit(state.copyWith(password: value));
  void onConfirmPasswordChanged(String value) => emit(state.copyWith(confirmPassword: value));


  bool get isLoggedIn => FirebaseAuth.instance.currentUser != null;

  /// -- REGISTER
  Future<void> register() async {
    if(state.fullName.trim().isEmpty){
      emit(state.copyWith(errorMessage: 'Full name is required'));
      return;
    }
    if(state.password != state.confirmPassword){
      emit(state.copyWith(errorMessage: 'Password doesn\'t match!!' ));
      return;
    }
    emit(state.copyWith(isLoading: true));
    try{
      await _repo.register(state.email, state.password,state.fullName);

      await _repo.logout();
      emit(state.copyWith(isSuccess: true));
    }catch(e){
      emit(state.copyWith(errorMessage: e.toString()));
    }


  }



  /// -- LOG IN
  Future<void> login() async {
    emit(state.copyWith(isLoading: true));

    try {
      await _repo.login(state.email, state.password);

      final prefs = await SharedPreferences.getInstance();
      if(state.rememberMe){
        await prefs.setString('saved_email', state.email);
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



  /// -- RESET PASSWORD
  Future<void> resetPassword() async {
    if(state.email.trim().isEmpty){
      emit(state.copyWith(errorMessage: 'Please enter your email'));
      return;
    }
    emit(state.copyWith(isLoading: true));
    try {
      await _repo.resetPassword(state.email);
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

  void resetForm(){
    emit(AuthState());
  }


}
