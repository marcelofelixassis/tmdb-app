import 'package:flutter/material.dart';
import 'package:tmdb_app/models/serieModel.dart';

class HorizontalScrollSerie extends StatefulWidget {
  final List<SerieModel> itens;

  HorizontalScrollSerie(this.itens);

  @override
  _HorizontalScrollSerieState createState() => _HorizontalScrollSerieState();
}

class _HorizontalScrollSerieState extends State<HorizontalScrollSerie> {
  final String poster400 = "https://image.tmdb.org/t/p/w400";
  final String poster500 = "https://image.tmdb.org/t/p/w500";

  @override
  Widget build(BuildContext context) {
    widget.itens.remove(0);
    return Container(
      height: 135,
      child: ListView.builder(
        itemCount: widget.itens.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext c, int index) {
          var name = widget.itens[index].name;
          var poster = widget.itens[index].posterPath.toString();

          return GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              '/series_details',
              arguments: {"position": index, "iten": widget.itens[index]}
            ),
            child: Container(
              width: 120,
              child:  Column(
                children: <Widget>[
                  Material(
                    shape: CircleBorder(),
                    clipBehavior: Clip.hardEdge,
                    color: Colors.transparent,
                    child: Ink.image(
                      image: NetworkImage("$poster400$poster"),
                      fit: BoxFit.fill,
                      width: 100.0,
                      height: 100.0,
                    ),
                  ),
                  Container(
                    width: 100,
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}