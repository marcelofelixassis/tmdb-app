import 'package:tmdb_app/models/serieModel.dart';
import 'package:meta/meta.dart';

class SerieState {
  List<SerieModel> topSeries;
  bool topSeriesLoading;

  SerieState({ @required this.topSeries, @required this.topSeriesLoading });

  factory SerieState.initialState() {
    return SerieState(
      topSeries: [],
      topSeriesLoading: false,
    );
  }

  SerieState copyWith({ List<SerieModel> topSeries, bool topSeriesLoading }) {
    return SerieState(
      topSeries: topSeries ?? this.topSeries,
      topSeriesLoading: topSeriesLoading ?? this.topSeriesLoading,
    );
  }
}