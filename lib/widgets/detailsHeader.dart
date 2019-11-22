import 'package:flutter/material.dart';

class DetailsHeader extends StatelessWidget {
  final String posterPath;
  final String tag;

  DetailsHeader(this.posterPath, this.tag);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: ClipImage(),
            child: Container(
              height: 400,
              child: Hero(
                tag: "tag",
                child:Image.network("https://image.tmdb.org/t/p/w500"+posterPath, fit:BoxFit.fill, width: MediaQuery.of(context).size.width),
              )
            ),
          )
        ],
      ),
    );
  }
}

class ClipImage extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height * 0.75 );

    var controlPoint = Offset(size.width / 2, size.height);
    var endPoint = Offset(size.width, size.height * 0.75);

    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}