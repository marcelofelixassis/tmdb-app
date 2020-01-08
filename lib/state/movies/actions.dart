import 'dart:convert';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:tmdb_app/models/movieModel.dart';
import 'package:tmdb_app/state/app_state.dart';
import 'package:http/http.dart' as http;

class MovieAction {}

/*
* Fetch Top Movies ACTIONS 
*/

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

/*
* Fetch Similar Movies ACTIONS 
*/

class FetchSimilarMovies extends MovieAction {
  ThunkAction<AppState> fetchSimilarMovies(int id) {
    return (Store<AppState> store) async {
      try {
        store.dispatch(LoadSimilarMovies(true));
        http.Response response = await http.get('https://api.themoviedb.org/3/movie/$id/similar?api_key=256474098763369bf9f4dd7ae2f26a94');
        var data = jsonDecode(response.body);
        var res = data['results'] as List;
        var list = res.map<MovieModel>((json) => MovieModel.fromJson(json)).toList();
        store.dispatch(SuccessSimilarMovies(list));
      } catch (e) {
        print('erro, $e');
      } finally {
        store.dispatch(LoadSimilarMovies(false));
        print('terminou');
      }
    };
  }
}

class LoadSimilarMovies extends MovieAction {
  final bool status;
  LoadSimilarMovies(this.status);
}

class SuccessSimilarMovies extends MovieAction {
  final List<MovieModel> currentSimilarMovies;
  SuccessSimilarMovies(this.currentSimilarMovies);
}