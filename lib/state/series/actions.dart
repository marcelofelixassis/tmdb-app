import 'dart:convert';
import 'package:tmdb_app/models/serieModel.dart';
import 'package:tmdb_app/state/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;

class SeriesAction {}

class FetchTopSeries extends SeriesAction {
  ThunkAction<AppState> fetchTopSeries = (Store<AppState> store) async {
    store.dispatch(LoadTopSeries(true));
    try {
      http.Response response = await http.get('https://api.themoviedb.org/3/tv/popular?api_key=256474098763369bf9f4dd7ae2f26a94');
      var data = jsonDecode(response.body);
      var rest = data['results'] as List; 
      var list = rest.map<SerieModel>((json) => SerieModel.fromJson(json)).toList();
      store.dispatch(SuccessTopSeries(list));
    } catch (e) {
      print("error, $e");
    } finally {
      store.dispatch(LoadTopSeries(false));
    }
  };
}

class LoadTopSeries extends SeriesAction {
  final bool status;
  LoadTopSeries(this.status);
}

class SuccessTopSeries extends SeriesAction {
  final List<SerieModel> topSeries;
  SuccessTopSeries(this.topSeries);
}
