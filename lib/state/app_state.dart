import 'package:tmdb_app/state/series/state.dart';
import 'package:meta/meta.dart';
class AppState {
  final SerieState serieState;
  
  AppState({
    @required this.serieState,
  });

  factory AppState.initialState() {
    return AppState(
      serieState: SerieState.initialState()
    );
  }

  AppState copyWith({ SerieState serieState }) {
    return AppState(
      serieState: serieState ?? this.serieState,
    );
  }

}