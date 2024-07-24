part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupError extends SignupState {
  final String errormsg;
  SignupError({required this.errormsg});
}

final class SignupSuccess extends SignupState {
  final String successmsg;
  SignupSuccess({required this.successmsg});
}
