part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class RegisterLoadingState extends RegisterState {}
final class RegisterSuccessState extends RegisterState {}
final class FailedToRegisterState extends RegisterState {
  final String errMessage;

  FailedToRegisterState({required this.errMessage});
}
