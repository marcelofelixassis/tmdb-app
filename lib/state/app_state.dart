import 'package:tmdb_app/state/movies/state.dart';
import 'package:tmdb_app/state/series/state.dart';
import 'package:meta/meta.dart';
class AppState {
  final SerieState serieState;
  final MovieState movieState;

  AppState({
    @required this.serieState,
    @required this.movieState,
  });

  factory AppState.initialState() {
    return AppState(
      serieState: SerieState.initialState(),
      movieState: MovieState.initialState(),
    );
  }

  AppState copyWith({ SerieState serieState, MovieState movieState }) {
    return AppState(
      serieState: serieState ?? this.serieState,
      movieState: movieState ?? this.movieState,
    );
  }

}