import 'package:flutter/material.dart';
import 'package:tmdb_app/models/movieModel.dart';

class SimilarMoviesList extends StatelessWidget {
  final List<MovieModel> similarMovies;

  SimilarMoviesList(this.similarMovies);
  
  @override
  Widget build(BuildContext context) {
    String poster400 = "https://image.tmdb.org/t/p/w400";

    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 15.0,
      mainAxisSpacing: 30.0,
      padding: EdgeInsets.only(top: 10.0),
      children: similarMovies.map((movie) => 
        Container(
          height: 400.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 0),
                blurRadius: 2.0,
              )
            ]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image(
              height: 400.0,
              image: NetworkImage("$poster400${movie.posterPath}"),
              fit: BoxFit.fill,
            ),
          )
        )
      ).toList(),
    );
  }
}