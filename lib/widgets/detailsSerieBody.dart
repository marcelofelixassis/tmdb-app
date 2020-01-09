import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tmdb_app/models/serieModel.dart';
import 'package:tmdb_app/state/app_state.dart';
import 'package:tmdb_app/state/series/state.dart';
import 'package:tmdb_app/widgets/horizontalScrollTitle.dart';
import 'package:tmdb_app/widgets/similarSeriesList.dart';

class DetailsSerieBody extends StatelessWidget {
  final SerieModel serie;

  DetailsSerieBody(this.serie);

  @override
  Widget build(BuildContext context) {
    return Container(
     child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SmoothStarRating(
              allowHalfRating: false,
              starCount: 5,
              rating: serie.voteAverage / 2,
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
                    serie.overview,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 23.0),
                    child: HorizontalScrollTitle("SIMILAR SERIES", TextAlign.left),
                  ),
                  StoreConnector<AppState, SerieState>(
                    converter: (store) => store.state.serieState,
                    builder: (context, serieState) {
                      if(!serieState.currentSimilarSeriesLoading && serieState.currentSimilarSeries.length > 0) {
                        return SimilarSeriesList(serieState.currentSimilarSeries);
                      }
                      return Container(
                        child: Text(
                          '...'
                        ),
                      );
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