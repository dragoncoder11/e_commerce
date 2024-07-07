part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class RegisterLoadingState extends AuthState {}
final class RegisterSuccessState extends AuthState {}
final class FailedToRegisterState extends AuthState {
  final String errMessage;

  FailedToRegisterState({required this.errMessage});
}
final class LoginLoadingState extends AuthState {}
final class LoginSuccessState extends AuthState {}
final class FailedToLoginState extends AuthState {
    final String errMessage;

  FailedToLoginState({required this.errMessage});

}

