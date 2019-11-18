import 'package:tmdb_app/state/series/actions.dart';
import 'package:tmdb_app/state/series/state.dart';

SerieState seriesReducer(SerieState state, SeriesAction action) {
  // if(action is AddMockTopSeries) {
  //   final updatedList = state.topSeries;
  //   updatedList.add(action.serie);

  //   return state.copyWith(
  //     topSeries: updatedList,
  //   );
  // }

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

  return state;
}