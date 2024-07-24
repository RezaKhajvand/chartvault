part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class GetLoginEvent extends LoginEvent {
  final String username;
  final String password;

  GetLoginEvent({required this.username, required this.password});
}
