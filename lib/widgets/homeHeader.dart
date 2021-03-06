import 'package:flutter/material.dart';
import 'package:tmdb_app/models/serieModel.dart';

class HomeHeader extends StatelessWidget {
  final SerieModel latestSerie;

  HomeHeader(this.latestSerie);
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0)
          ),
          child: Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            height: 420,
            child: Stack(
              children: <Widget>[
                ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(Rect.fromLTRB(0, 100, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.network("https://image.tmdb.org/t/p/w500"+latestSerie.posterPath, fit:BoxFit.fill, width: MediaQuery.of(context).size.width),
                ),
              ],
            ), 
          ),
        ),
        Container(
          child: Positioned(
            top: 30.0,
            left: 6.0,
            child: Opacity(
              opacity: 0.7,
              child:  Icon(
                Icons.movie_filter,
                size: 40,
                color: Colors.red
              ),
            )
          ),
        ),
        Container(
          height: 420,
          padding: EdgeInsets.only(bottom: 25.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Opacity(
              opacity: 0.7,
              child: FlatButton.icon(
                color: Colors.red,
                icon: Icon(Icons.info),
                label: Text('More details'),
                onPressed: () => Navigator.of(context).pushNamed(
                  '/series_details',
                  arguments: {"iten": latestSerie}
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}