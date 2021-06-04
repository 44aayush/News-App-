
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/models/article_model.dart';
import 'package:news_app_bloc/repositories/news_repository.dart';

import 'news_events.dart';
import 'news_states.dart';

class NewsBloc extends Bloc<NewsEvents, NewsStates> {
  NewsRepository newsRepositoty;
  NewsBloc({required NewsStates initialState, required this.newsRepositoty})
      : super(initialState) {
    add(StartEvent());
  }

  @override
  Stream<NewsStates> mapEventToState(NewsEvents event) async* {
    if (event is StartEvent) {
      try {
        List<ArticleModel> _articleList = [];
        yield NewsLoadingState();
        _articleList = await newsRepositoty.fetchNews();
        yield NewsLoadedState(articleList: _articleList);
      } catch (e) {
        print(e);
      }
    }
  }
}
