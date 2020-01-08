import 'package:flutter/material.dart';

class HorizontalScrollTitle extends StatelessWidget {
  final String title;
  final TextAlign position;
  HorizontalScrollTitle(this.title, this.position);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 4.0,
          bottom: 4.0,
        ),
        child: Text(
          title,
          textAlign: position,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.5,
            color: Color.fromRGBO(124, 128, 128, 1.0),
          ),
        ),
      ),
    );
  }
}