import 'package:flutter/material.dart';

class CreateDialog{
  buildDialog(BuildContext context, Function action) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Attention"),
        content: Text("Due to lack of API information will display a standart video."),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text('CANCEL'),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          MaterialButton(
            elevation: 5.0,
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
              action();
            },
          )
        ],
      );
    });
  }
}