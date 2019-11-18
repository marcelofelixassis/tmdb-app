import 'package:flutter/material.dart';

class HorizontalScrollTitle extends StatelessWidget {
  final String title;
  HorizontalScrollTitle(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          left: 12.0,
          bottom: 8.0,
          right: 12.0,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.5,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}