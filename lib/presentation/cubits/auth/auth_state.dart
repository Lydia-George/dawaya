part of 'auth_cubit.dart';

 class AuthState {
   final bool isLoading;
   final bool isSuccess;
   final String? errorMessage;
   final bool isPasswordResetSent;
  final bool rememberMe;
  final String? savedEmail;
  final String email;
  final String fullName;
  final String password ;
  final String confirmPassword;


  const AuthState({
    this.isLoading=false,
    this.isSuccess=false,
    this.errorMessage,
    this.isPasswordResetSent=false,
    this.rememberMe = false,
    this.savedEmail,
    this.email = '',
    this.fullName = '',
    this.password = '',
    this.confirmPassword = '',

  });

  AuthState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    bool? isPasswordResetSent,
    bool? rememberMe,
    String? savedEmail,
    String? fullName,
    String? email,
    String? password,
    String? confirmPassword,
}){
    return AuthState(
      isLoading: isLoading ?? false,
      isSuccess: isSuccess ?? false,
      errorMessage: errorMessage,
      isPasswordResetSent: isPasswordResetSent ?? false,
      rememberMe:  rememberMe ?? this.rememberMe,
      savedEmail: savedEmail ?? this.savedEmail,
      email: email ?? this.email,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }




}

