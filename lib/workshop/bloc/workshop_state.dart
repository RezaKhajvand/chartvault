part of 'workshop_bloc.dart';

@immutable
sealed class WorkshopState {}

final class WorkshopInitial extends WorkshopState {}

final class WorkshopLoading extends WorkshopState {}

final class WorkshopLoaded extends WorkshopState {
  final Workshop workshop;

  WorkshopLoaded({required this.workshop});
}

final class WorkshopError extends WorkshopState {
  final String errormsg;

  WorkshopError({required this.errormsg});
}
