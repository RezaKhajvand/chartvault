part of 'signals_bloc.dart';

@immutable
sealed class SignalsEvent {}

class SignalsFetchEvent extends SignalsEvent {
  final int? statusCode;

  SignalsFetchEvent({this.statusCode});
}
