import 'dart:convert';
import 'package:tmdb_app/models/serieModel.dart';
import 'package:tmdb_app/state/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;

class SeriesAction {}

/*
* Fetch Top Series ACTIONS 
*/

class FetchTopSeries extends SeriesAction {
  ThunkAction<AppState> fetchTopSeries = (Store<AppState> store) async {
    store.dispatch(LoadTopSeries(true));
    try {
      http.Response response = await http.get('https://api.themoviedb.org/3/tv/top_rated?api_key=256474098763369bf9f4dd7ae2f26a94');
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


/*
* Fetch Similar Series ACTIONS 
*/

class FetchSimilarSeries extends SeriesAction {
  ThunkAction<AppState> fetchSimilarSeries(int id) {
    return (Store<AppState> store) async {
      try {
        store.dispatch(LoadSimilarSeries(true));
        http.Response response = await http.get('https://api.themoviedb.org/3/tv/$id/similar?api_key=256474098763369bf9f4dd7ae2f26a94');
        var data = jsonDecode(response.body);
        var res = data['results'] as List;
        var list = res.map<SerieModel>((json) => SerieModel.fromJson(json)).toList();
        store.dispatch(SuccessSimilarSeries(list));
      } catch (e) {
        print('erro, $e');
      } finally {
        store.dispatch(LoadSimilarSeries(false));
        print('terminou');
      }
    };
  }
}

class LoadSimilarSeries extends SeriesAction {
  final bool status;
  LoadSimilarSeries(this.status);
}

class SuccessSimilarSeries extends SeriesAction {
  final List<SerieModel> currentSimilarSeries;
  SuccessSimilarSeries(this.currentSimilarSeries);
}
