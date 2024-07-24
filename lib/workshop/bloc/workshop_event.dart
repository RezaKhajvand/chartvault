part of 'workshop_bloc.dart';

@immutable
sealed class WorkshopEvent {}

final class FetchWorkshopEvent extends WorkshopEvent {}
