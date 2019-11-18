import 'package:flutter/material.dart';
import 'package:tmdb_app/models/movieModel.dart';

class HorizontalScrollMovie extends StatelessWidget {
  final List<MovieModel> itens;
  final String poster400 = "https://image.tmdb.org/t/p/w400";
  final String poster500 = "https://image.tmdb.org/t/p/w500";

  HorizontalScrollMovie(this.itens);

  @override
  Widget build(BuildContext context) {
    itens.remove(0);
    return Container(
      height: 135,
      child: ListView.builder(
        itemCount: itens.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext c, int index) {
          var title = itens[index].title;
          var poster = itens[index].posterPath.toString();

          return Container(
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
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}