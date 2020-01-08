import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tmdb_app/models/movieModel.dart';
import 'package:tmdb_app/state/app_state.dart';
import 'package:tmdb_app/state/movies/actions.dart';
import 'package:tmdb_app/widgets/detailsHeader.dart';
import 'package:tmdb_app/widgets/detailsMovieBody.dart';

class MoviesDatails extends StatefulWidget {
  final int position;
  final MovieModel iten;
  
  MoviesDatails({ Key key, this.position, this.iten }) : super(key: key);
  
  @override
  _MoviesDatailsState createState() => _MoviesDatailsState();
}

class _MoviesDatailsState extends State<MoviesDatails> {
  @override
  initState(){
    print(widget.iten.id);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    StoreProvider.of<AppState>(context).dispatch(FetchSimilarMovies().fetchSimilarMovies(widget.iten.id));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DetailsHeader(widget.iten.posterPath),
            DetailsMovieBody(widget.iten)
          ],
        ),
      )
    );
  }
}