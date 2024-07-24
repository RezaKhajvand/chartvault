import 'package:bloc/bloc.dart';
import 'package:chartvault/news/data/news_datasource.dart';
import 'package:chartvault/news/models/news_model.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<FetchNewsEvent>((event, emit) async {
      emit(NewsLoading());
      try {
        var news = newsModelFromJson(await fetchNews());
        emit(NewsLoaded(news: news));
      } catch (e) {
        emit(NewsError(errormsg: e.toString()));
      }
    });
  }
}
