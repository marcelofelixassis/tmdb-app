import 'dart:convert';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:tmdb_app/models/movieModel.dart';
import 'package:tmdb_app/state/app_state.dart';
import 'package:http/http.dart' as http;

class MovieAction {}

class FetchTopMovies extends MovieAction {
  ThunkAction<AppState> fetchTopMovies = (Store<AppState> store) async {
    store.dispatch(LoadTopMovies(true));
    try {
      http.Response response = await http.get('https://api.themoviedb.org/3/movie/top_rated?api_key=256474098763369bf9f4dd7ae2f26a94');
      var data = jsonDecode(response.body);
      var res = data['results'] as List;
      var list = res.map<MovieModel>((json) => MovieModel.fromJson(json)).toList();
      store.dispatch(SuccessTopMovies(list));
    } catch (e) {
      print("error, $e");
    } finally {
      store.dispatch(LoadTopMovies(false));
    }
  };
}

class LoadTopMovies extends MovieAction {
  final bool status;
  LoadTopMovies(this.status);
}

class SuccessTopMovies extends MovieAction {
  final List<MovieModel> topMovies;
  SuccessTopMovies(this.topMovies);
}