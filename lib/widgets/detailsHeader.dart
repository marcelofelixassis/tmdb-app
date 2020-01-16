import 'package:flutter/material.dart';
import 'package:tmdb_app/utils/clipShadowPath.dart';
import 'package:tmdb_app/utils/createDialog.dart';
import 'package:video_player/video_player.dart';

class DetailsHeader extends StatefulWidget {
  final String posterPath;

  DetailsHeader(this.posterPath);

  @override
  _DetailsHeaderState createState() => _DetailsHeaderState();
}

class _DetailsHeaderState extends State<DetailsHeader> {
  VideoPlayerController playerController;
  VoidCallback listener;

  @override
  void initState() {
    super.initState();
    listener = () {
      setState(() {});
    };
  }

  void createVideo() {
    if(playerController == null) {
      playerController = VideoPlayerController.network("https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4")
      ..addListener(listener)
      ..setVolume(1.0)
      ..initialize()
      ..play();
    } else {
      playerController = null;
    }
  }

  playOrDesrtoyVideo() {
    if(playerController == null) {
      createVideo();
    } else {
      playerController = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    String poster500 = "https://image.tmdb.org/t/p/w500";

    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              (playerController == null
                ? ClipShadowPath(
                    shadow: Shadow(
                      blurRadius: 5
                    ),
                    clipper: ClipImage(),
                    child: Container(
                      transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                      height: 400,
                      child:Image.network("$poster500${widget.posterPath}", fit:BoxFit.fill, width: MediaQuery.of(context).size.width),
                    ),
                  )
                : Container(
                  transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                  height: 400,
                  child: AspectRatio(
                    aspectRatio: 3/2, child: VideoPlayer(playerController)
                  ),
                )
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
                    onPressed: () {
                      if(playerController == null) {
                        CreateDialog().buildDialog(context, createVideo);
                      } else {
                        createVideo();
                      }
                    },
                    elevation: 12.0,
                    child: Icon(
                      (playerController == null ? Icons.play_arrow : Icons.close),
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