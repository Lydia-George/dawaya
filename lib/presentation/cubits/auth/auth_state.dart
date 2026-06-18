part of 'auth_cubit.dart';

 class AuthState {
  final bool rememberMe;
  final String? savedEmail;

  const AuthState({
    this.rememberMe = false,
    this.savedEmail
  });
  AuthState copyWith({
    bool? rememberMe,
    String? savedEmail,
}){
    return AuthState(
      rememberMe:  rememberMe ?? this.rememberMe,
      savedEmail: savedEmail ?? this.savedEmail,
    );
  }




}

class AuthInit extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class PasswordResetEmailSent extends AuthState {}
