import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ButtonState();
  }

}

class ButtonState extends State<ButtonWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("button style"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("normal"),
              onPressed: ()=>{},
            ),
            FlatButton(
              child: Text("normal"),
              onPressed: ()=>{},
            ),
            OutlineButton(
              child: Text("normal"),
              onPressed: ()=>{},
            ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: ()=>{},
            ),
            RaisedButton.icon(onPressed: _onPressed, icon: Icon(Icons.send), label: Text("发送")),
            OutlineButton.icon(onPressed: _onPressed, icon: Icon(Icons.add), label: Text("添加")),
            FlatButton.icon(onPressed: _onPressed, icon: Icon(Icons.details), label: Text("详情")),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: _onPressed,

            )
          ],
        ),
      ),
    );
  }

  void _onPressed() {
    print('ButtonState._onPressed');
  }
}