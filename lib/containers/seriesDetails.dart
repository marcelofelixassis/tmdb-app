import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tmdb_app/models/serieModel.dart';
import 'package:tmdb_app/state/app_state.dart';
import 'package:tmdb_app/state/series/actions.dart';
import 'package:tmdb_app/widgets/detailsHeader.dart';
import 'package:tmdb_app/widgets/detailsSerieBody.dart';

class SeriesDetails extends StatefulWidget {
  final SerieModel iten;

  SeriesDetails({ Key key, this.iten }) : super(key: key);

  @override
  _SeriesDetailsState createState() => _SeriesDetailsState();
}

class _SeriesDetailsState extends State<SeriesDetails> {
  @override
  void didChangeDependencies() {
    StoreProvider.of<AppState>(context).dispatch(FetchSimilarSeries().fetchSimilarSeries(widget.iten.id));
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
            DetailsSerieBody(widget.iten)
          ],
        ),
      ),
    );
  }
}