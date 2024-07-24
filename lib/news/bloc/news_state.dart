part of 'news_bloc.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsLoaded extends NewsState {
  final NewsModel news;

  NewsLoaded({required this.news});
}

final class NewsError extends NewsState {
  final String errormsg;

  NewsError({required this.errormsg});
}
