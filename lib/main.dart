import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tmdb_app/containers/home.dart';
import 'package:tmdb_app/containers/moviesDetails.dart';
import 'package:tmdb_app/containers/seriesDetails.dart';
import 'package:tmdb_app/containers/splash.dart';
import 'package:tmdb_app/state/app_store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: appStore,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'OpenSans',
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: _getRoute,
      ),
    );
  }

  Route _getRoute(RouteSettings settings) {
    final Map<String, dynamic> arguments = settings.arguments;
    switch(settings.name){
      case '/':
        return _buildRoute(settings, Splash());
      case '/home':
        return _buildRoute(settings, HomeContainer());
      case '/movies_datails':
        return _buildRoute(settings, MoviesDatails(
          iten: arguments['iten'],
        ));
      case '/series_details':
        return _buildRoute(settings, SeriesDetails(
          iten: arguments['iten']
        ));
      default:
        return _buildRoute(settings, Splash());
    } 
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return new MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder
    );
  }
}
