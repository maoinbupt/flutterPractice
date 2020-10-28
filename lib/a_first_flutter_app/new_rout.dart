import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  NewRoute({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Route")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("this is new Route page: value is $text"),
          FlatButton(
            child: Text("navi back"),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.pop(context, "返回值");
            },
          )
        ],
      )),
    );
  }
}
