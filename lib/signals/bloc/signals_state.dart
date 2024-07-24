part of 'signals_bloc.dart';

@immutable
sealed class SignalsState {}

final class SignalsInitial extends SignalsState {}

final class SignalsLoading extends SignalsState {}

final class SignalsLoaded extends SignalsState {
  final SignalModel signals;

  SignalsLoaded({required this.signals});
}

final class SignalsError extends SignalsState {
  final String message;

  SignalsError({required this.message});
}
