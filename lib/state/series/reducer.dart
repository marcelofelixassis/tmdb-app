import 'package:tmdb_app/state/series/actions.dart';
import 'package:tmdb_app/state/series/state.dart';

SerieState seriesReducer(SerieState state, SeriesAction action) {
  if(action is LoadTopSeries) {
    return state.copyWith(
      topSeriesLoading: action.status,
    );
  }

  if(action is SuccessTopSeries) {
    return state.copyWith(
      topSeries: action.topSeries,
    );
  } 

  if(action is LoadSimilarSeries) {
    return state.copyWith(
      currentSimilarSeriesLoading: action.status,
    );
  }

  if(action is SuccessSimilarSeries) {
    return state.copyWith(
      currentSimilarSeries: action.currentSimilarSeries,
    );
  }

  return state;
}