import 'package:flutter/material.dart';
import 'package:tmdb_app/models/serieModel.dart';

class SimilarSeriesList extends StatelessWidget {
  final List<SerieModel> similarSeries;

  SimilarSeriesList(this.similarSeries);

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
      children: similarSeries.map((serie) => 
        Container(
          height: 400.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(10.0, 8.0),
                blurRadius: 9.0,
              )
            ]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image(
              height: 400.0,
              image: NetworkImage("$poster400${serie.posterPath}"),
              fit: BoxFit.fill,
            ),
          )
        )
      ).toList(),
    );
  }
}