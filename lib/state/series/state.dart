import 'package:tmdb_app/models/serieModel.dart';
import 'package:meta/meta.dart';

class SerieState {
  List<SerieModel> topSeries;
  bool topSeriesLoading;
  List<SerieModel> currentSimilarSeries;
  bool currentSimilarSeriesLoading;

  SerieState({
    @required this.topSeries,
    @required this.topSeriesLoading,
    @required this.currentSimilarSeries,
    @required this.currentSimilarSeriesLoading,
  });

  factory SerieState.initialState() {
    return SerieState(
      topSeries: [],
      topSeriesLoading: false,
      currentSimilarSeries: [],
      currentSimilarSeriesLoading: false,
    );
  }

  SerieState copyWith({
    List<SerieModel> topSeries,
    bool topSeriesLoading,
    List<SerieModel> currentSimilarSeries,
    bool currentSimilarSeriesLoading,
    }) {
    return SerieState(
      topSeries: topSeries ?? this.topSeries,
      topSeriesLoading: topSeriesLoading ?? this.topSeriesLoading,
      currentSimilarSeries: currentSimilarSeries ?? this.currentSimilarSeries,
      currentSimilarSeriesLoading: currentSimilarSeriesLoading ?? this.currentSimilarSeriesLoading,
    );
  }
}