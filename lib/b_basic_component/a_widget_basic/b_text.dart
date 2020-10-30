import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TextState();
  }





}

class TextState extends State<TextWidget>{

  var _tapRec = TapGestureRecognizer();
  bool _toogle = false;


  @override
  void dispose() {
    // TODO: implement dispose
    _tapRec.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("text style"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Hello World" * 4,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 1.5,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: "Courier",
                background: Paint()
                  ..color = Colors.yellow
                  ..strokeWidth = 3,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ),
            Text.rich(TextSpan(
              children: [
                TextSpan(
                    text: "点我变色: "
                ),
                TextSpan(
                  text: "https://flutterchina.club",
                  style: TextStyle(
                    color: _toogle?Colors.blue:Colors.red,
                  ),
                  recognizer: _tapRec
                    ..onTap = (){
                      setState(() {
                        _toogle = !_toogle;
                      });
                    },
                )
              ],

            )),
            DefaultTextStyle(
              style: TextStyle(
                color: Colors.red,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.start,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Hello world"),
                  Text("I`m gaofeng1"),
                  Text(
                    "I`m gaofeng2",
                    style: TextStyle(
                      inherit: false,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
