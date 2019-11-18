import 'package:flutter/cupertino.dart';
import 'package:tmdb_app/models/movieModel.dart';

class MovieState {
  List<MovieModel> topMovies;
  bool topMoviesLoading;

  MovieState({ @required this.topMovies, @required this.topMoviesLoading });

  factory MovieState.initialState(){
    return MovieState(
      topMovies: [],
      topMoviesLoading: false,
    );
  }

  MovieState copyWith({ List<MovieModel> topMovies, bool topMoviesLoading }) {
    print(topMovies);
    return MovieState(
      topMovies: topMovies ?? this.topMovies,
      topMoviesLoading:  topMoviesLoading ?? this.topMoviesLoading,
    );
  }
}