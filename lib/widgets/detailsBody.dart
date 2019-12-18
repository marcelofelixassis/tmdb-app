import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tmdb_app/models/movieModel.dart';

class DetailsBody extends StatelessWidget {
  final MovieModel movie;

  DetailsBody(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Text(
              movie.overview,
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}