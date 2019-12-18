import 'package:flutter/material.dart';
import 'package:tmdb_app/models/movieModel.dart';
import 'package:tmdb_app/widgets/detailsHeader.dart';
import 'package:tmdb_app/widgets/detailsBody.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DetailsHeader(widget.iten.posterPath),
            DetailsBody(widget.iten)
          ],
        ),
      )
    );
  }
}