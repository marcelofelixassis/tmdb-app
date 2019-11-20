import 'package:flutter/material.dart';
import 'package:tmdb_app/models/movieModel.dart';
 
class TopMoviesScrollCard extends StatefulWidget {
  final List<MovieModel> itens;

  TopMoviesScrollCard(this.itens);

  @override
  _TopMoviesScrollCardState createState() => _TopMoviesScrollCardState();
}

class _TopMoviesScrollCardState extends State<TopMoviesScrollCard> {
  String poster400 = "https://image.tmdb.org/t/p/w400";
  String poster500 = "https://image.tmdb.org/t/p/w500";
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.6);
  }

   _movieSelector(int index) {
    var posterImage = widget.itens[index].backdropPath;
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 200.0,
            width: Curves.easeInOut.transform(value) * 315.0,
            child: widget,
          ),
        );
      },
      child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: posterImage,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.transparent],
                          ).createShader(Rect.fromLTRB(0, 100, rect.width, 190));
                        },
                        blendMode: BlendMode.dstIn,
                        child: Image(
                          image: NetworkImage("$poster400$posterImage"),
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                      )
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20.0,
              bottom: 30.0,
              child: Container(
                width: 200.0,
                child: Text(
                  widget.itens[index].title,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: double.infinity,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.itens.length,
        itemBuilder: (BuildContext context, int index) {
          return _movieSelector(index);
        },
      ),
    );
  }
}