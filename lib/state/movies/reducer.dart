import 'package:tmdb_app/state/movies/actions.dart';
import 'package:tmdb_app/state/movies/state.dart';

MovieState moviesReducer(MovieState state, MovieAction action) {
  if(action is LoadTopMovies){
    return state.copyWith(
      topMoviesLoading: action.status,
    );
  }

  if(action is SuccessTopMovies) {
    return state.copyWith(
      topMovies: action.topMovies,
    );
  }

  return state;
}