part of 'auth_cubit.dart';

 class AuthState {
   final bool isLoading;
   final bool isSuccess;
   final String? errorMessage;
   final bool isPasswordResetSent;
  final bool rememberMe;
  final String? savedEmail;

  const AuthState({
    this.isLoading=false,
    this.isSuccess=false,
    this.errorMessage,
    this.isPasswordResetSent=false,
    this.rememberMe = false,
    this.savedEmail,
  });
  AuthState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    bool? isPasswordResetSent,
    bool? rememberMe,
    String? savedEmail,
}){
    return AuthState(
      isLoading: isLoading ?? false,
      isSuccess: isSuccess ?? false,
      errorMessage: errorMessage,
      isPasswordResetSent: isPasswordResetSent ?? false,
      rememberMe:  rememberMe ?? this.rememberMe,
      savedEmail: savedEmail ?? this.savedEmail,
    );
  }




}

