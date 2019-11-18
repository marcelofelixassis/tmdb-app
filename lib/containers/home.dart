import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tmdb_app/state/app_state.dart';
import 'package:tmdb_app/state/movies/actions.dart';
import 'package:tmdb_app/state/movies/state.dart';
import 'package:tmdb_app/state/series/actions.dart';
import 'package:tmdb_app/state/series/state.dart';
import 'package:tmdb_app/widgets/homeHeader.dart';
import 'package:tmdb_app/widgets/horizontalScrollMovie.dart';
import 'package:tmdb_app/widgets/horizontalScrollSerie.dart';
import 'package:tmdb_app/widgets/horizontalScrollTitle.dart';

class HomeContainer extends StatefulWidget {
  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {

  @override
  void didChangeDependencies() {
    fetchTopSeries();
    fetchTopMovies();
    super.didChangeDependencies();
  }

  void fetchTopSeries() {
    StoreProvider.of<AppState>(context).dispatch(FetchTopSeries().fetchTopSeries);
  }

  void fetchTopMovies() {
    StoreProvider.of<AppState>(context).dispatch(FetchTopMovies().fetchTopMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StoreConnector<AppState, SerieState>(
              converter: (store) => store.state.serieState,
              builder: (context, serieState) {
                if(serieState.topSeriesLoading) {
                  return Container(
                    height: 420,
                    child: Center(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(),
                      ),
                    ) 
                  );
                } else {
                  var rng = new Random();
                  return HomeHeader(serieState.topSeries[rng.nextInt(20)]);
                }
              },
            ),
            HorizontalScrollTitle("TOP SERIES"),
            StoreConnector<AppState, SerieState>(
              converter: (store) => store.state.serieState,
              builder: (context, serieState) {
                if(serieState.topSeriesLoading) {
                  return CircularProgressIndicator();
                } else {
                  return HorizontalScrollSerie(serieState.topSeries);
                }
              },
            ),
            HorizontalScrollTitle("TOP MOVIES"),
            StoreConnector<AppState, MovieState>(
              converter: (store) => store.state.movieState,
              builder: (context, movieState) {
                if(movieState.topMoviesLoading) {
                  return CircularProgressIndicator();
                } else {
                  return HorizontalScrollMovie(movieState.topMovies);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}