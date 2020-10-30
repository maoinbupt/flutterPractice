import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GestureDetectorDragWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // return GestureDetectorDragState();
    return ScaleTestState();
    // return GestureDetectorState();
  }
}

class GestureDetectorDragState extends State<GestureDetectorDragWidget> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("gesture detector"),
      ),
      body: Stack(children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            onPanDown: (DragDownDetails e) {
              print("用户手指按下：${e.globalPosition}");
            },
            onPanUpdate: (DragUpdateDetails e) {
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e) {
              print("滑动结束速度 ：${e.velocity}");
            },
          ),
        ),
      ]),
    );
  }
}

class ScaleTestState extends State<GestureDetectorDragWidget>{
  double _width = 200.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Image.asset("imgs/avatar.png",width: _width,),
        onScaleUpdate: (ScaleUpdateDetails e){
          _width = 200*e.scale.clamp(0.8, 10.0);
        },
      )


    );
  }
}

class GestureDetectorState extends State<GestureDetectorDragWidget>{
  String _operation = "not detected";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("gesture detector"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 100,
                height: 50,
                child: Text(
                  _operation,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () => updateText("onTap"),
              onDoubleTap: () => updateText("onDoubleTap"),
              onLongPress: () {
                updateText("onLongPress");

              },

            ),



          ],
        ),
      ),
    );
  }

  void updateText(String text){
    setState(() {
      _operation = text;
    });
  }

  void _onPressed() {
    print('ButtonState._onPressed');
  }
}
