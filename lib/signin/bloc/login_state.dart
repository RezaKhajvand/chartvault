part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginError extends LoginState {
  final String errormsg;

  LoginError({required this.errormsg});
}

final class LoginLoaded extends LoginState {}
