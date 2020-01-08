import 'package:flutter/cupertino.dart';
import 'package:tmdb_app/models/movieModel.dart';

class MovieState {
  List<MovieModel> topMovies;
  bool topMoviesLoading;
  List<MovieModel> currentSimilarMovies;
  bool currentSimilarMoviesLoading;

  MovieState({
    @required this.topMovies,
    @required this.topMoviesLoading,
    @required this.currentSimilarMovies,
    @required this.currentSimilarMoviesLoading,
  });

  factory MovieState.initialState(){
    return MovieState(
      topMovies: [],
      topMoviesLoading: false,
      currentSimilarMovies: [],
      currentSimilarMoviesLoading: false,
    );
  }

  MovieState copyWith({
    List<MovieModel> topMovies,
    bool topMoviesLoading,
    List<MovieModel> currentSimilarMovies,
    bool currentSimilarMoviesLoading,
    }) {
    return MovieState(
      topMovies: topMovies ?? this.topMovies,
      topMoviesLoading:  topMoviesLoading ?? this.topMoviesLoading,
      currentSimilarMovies: currentSimilarMovies ?? this.currentSimilarMovies,
      currentSimilarMoviesLoading: currentSimilarMoviesLoading ?? this.currentSimilarMoviesLoading,
    );
  }
}