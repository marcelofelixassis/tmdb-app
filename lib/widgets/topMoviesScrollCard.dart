import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
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
    _pageController = PageController(initialPage: 1, viewportFraction: 0.5);
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
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
          '/movies_datails',
          arguments: {"position": index, "iten": widget.itens[index]}
        ),
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
                      child: Hero(
                        tag: "${widget.itens[index].id}-$index",
                        child:Image(
                          image: NetworkImage("$poster400$posterImage"),
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                      )
                    )
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20.0,
              bottom: 30.0,
              right: 20.0,
              child: Container(
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
            Positioned(
              left: 20.0,
              top: 30.0,
              right: 20.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SmoothStarRating(
                    allowHalfRating: false,
                    starCount: 5,
                    rating: widget.itens[index].voteAverage / 2,
                    size: 20.0,
                    color: Colors.red,
                    borderColor: Colors.red,
                    spacing:1.5
                  ),
                ], 
              ),
            ),
          ],
        ),
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