part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class GetSignupEvent extends SignupEvent {
  final String name;
  final String email;
  final String password;
  final String confirmpassword;
  final String number;
  GetSignupEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmpassword,
    required this.number,
  });
}
