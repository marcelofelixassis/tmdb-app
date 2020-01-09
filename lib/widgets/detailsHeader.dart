import 'package:flutter/material.dart';
import 'package:tmdb_app/utils/clipShadowPath.dart';

class DetailsHeader extends StatelessWidget {
  final String posterPath;

  DetailsHeader(this.posterPath);

  @override
  Widget build(BuildContext context) {
    String poster500 = "https://image.tmdb.org/t/p/w500";

    return Container(
      child: Stack(
        children: <Widget>[
          ClipShadowPath(
            shadow: Shadow(
              blurRadius: 5
            ),
            clipper: ClipImage(),
            child: Container(
              transform: Matrix4.translationValues(0.0, -50.0, 0.0),
              height: 400,
              child:Image.network("$poster500$posterPath", fit:BoxFit.fill, width: MediaQuery.of(context).size.width),
            ),
          ),
          Positioned.fill(
            top: 30.0,
            left: 6.0,
            child: Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned.fill(
            bottom: 20.0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RawMaterialButton(
                padding: EdgeInsets.all(10.0),
                onPressed: () => {},
                elevation: 12.0,
                child: Icon(
                  Icons.play_arrow,
                  size: 40.0,
                  color: Colors.red,
                ),
                shape: CircleBorder(),
                fillColor: Colors.white,
              ),
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

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}