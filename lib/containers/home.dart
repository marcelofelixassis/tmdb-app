import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tmdb_app/state/app_state.dart';
import 'package:tmdb_app/state/movies/state.dart';
import 'package:tmdb_app/state/series/state.dart';
import 'package:tmdb_app/widgets/homeHeader.dart';
import 'package:tmdb_app/widgets/horizontalScrollSerie.dart';
import 'package:tmdb_app/widgets/horizontalScrollTitle.dart';
import 'package:tmdb_app/widgets/topMoviesScrollCard.dart';

class HomeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  return HomeHeader(serieState.topSeries[rng.nextInt(serieState.topSeries.length)]);
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
                  return
                    TopMoviesScrollCard(movieState.topMovies);
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
          ],
        ),
      ),
    );
  }
}