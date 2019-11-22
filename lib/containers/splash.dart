import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:tmdb_app/state/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tmdb_app/state/movies/actions.dart';
import 'package:tmdb_app/state/series/actions.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AnimationController _loadingController;

  @override
  void initState() {
    super.initState();
    _loadingController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void didChangeDependencies() {
    fetchTopSeries();
    fetchTopMovies();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _loadingController.dispose();
    super.dispose();
  }

  void fetchTopSeries() {
    StoreProvider.of<AppState>(context).dispatch(FetchTopSeries().fetchTopSeries);
  }

  void fetchTopMovies() {
    StoreProvider.of<AppState>(context).dispatch(FetchTopMovies().fetchTopMovies);
  }

  _goTo(String pageName) {
    WidgetsBinding.instance.addPostFrameCallback((_) => 
      Navigator.of(context).pushNamedAndRemoveUntil(pageName, (Route<dynamic> route) => false)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          if(!state.serieState.topSeriesLoading && !state.movieState.topMoviesLoading) {
            _goTo("/home");
          }
          return Center(
            child: Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 40.0,
                  ),
                ],
              ),
              child: Center(
                child: AnimatedBuilder(
                  animation: _loadingController,
                  child: Icon(Icons.movie_filter, size: 150.0, color: Colors.red),
                  builder: (context, child) => Transform.rotate(
                    child: child,
                    angle: _loadingController.value * 8.0 * math.pi,
                  ),
                )
              )
            ),
          );
        },
      )
    );
  }
}