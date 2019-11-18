import 'package:tmdb_app/state/app_state.dart';
import 'package:tmdb_app/state/movies/actions.dart';
import 'package:tmdb_app/state/movies/reducer.dart';
import 'package:tmdb_app/state/series/actions.dart';
import 'package:tmdb_app/state/series/reducer.dart';
import 'package:redux/redux.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, SeriesAction>(_seriesReducer),
  TypedReducer<AppState, MovieAction>(_moviesReducer),
]);

AppState _seriesReducer(AppState state, SeriesAction action) {
  return state.copyWith(
    serieState: seriesReducer(state.serieState, action) 
  );
}

AppState _moviesReducer(AppState state, MovieAction action) {
  return state.copyWith(
    movieState: moviesReducer(state.movieState, action)
  );
}