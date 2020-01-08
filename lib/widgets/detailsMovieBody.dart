import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tmdb_app/models/movieModel.dart';
import 'package:tmdb_app/state/app_state.dart';
import 'package:tmdb_app/state/movies/state.dart';
import 'package:tmdb_app/widgets/horizontalScrollTitle.dart';
import 'package:tmdb_app/widgets/similarMoviesList.dart';

class DetailsMovieBody extends StatelessWidget {
  final MovieModel movie;

  DetailsMovieBody(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SmoothStarRating(
              allowHalfRating: false,
              starCount: 5,
              rating: movie.voteAverage / 2,
              size: 20.0,
              color: Colors.red,
              borderColor: Colors.red,
              spacing:1.5
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    movie.overview,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 23.0),
                    child: HorizontalScrollTitle("SIMILAR MOVIES", TextAlign.left),
                  ),
                  StoreConnector<AppState, MovieState>(
                    converter: (store) => store.state.movieState,
                    builder: (context, movieState) {
                      if(!movieState.currentSimilarMoviesLoading && movieState.currentSimilarMovies.length > 0) {
                        return SimilarMoviesList(movieState.currentSimilarMovies);
                      }
                      return null;
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}