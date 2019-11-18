import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tmdb_app/state/app_state.dart';
import 'package:tmdb_app/state/series/actions.dart';
import 'package:tmdb_app/state/series/state.dart';
import 'package:tmdb_app/widgets/homeHeader.dart';
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
    super.didChangeDependencies();
  }

  void fetchTopSeries() {
    StoreProvider.of<AppState>(context).dispatch(FetchTopSeries().fetchTopSeries);
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
                if(serieState.topSeries.isEmpty) {
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
                if(serieState.topSeries.isEmpty) {
                  return CircularProgressIndicator();
                } else {
                  return HorizontalScrollSerie(serieState.topSeries);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}