import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final int initValue;

  const CounterWidget({Key key, this.initValue: 0}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CounterState();
  }
}

class _CounterState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(
          child: Column(
        children: <Widget>[
          FlatButton(
            child: Text("$_counter"),
            onPressed: () {
              setState(() {
                ++_counter;
              });
            },
          ),
          FlatButton(
            child: Text("show snakebar"),
            onPressed: () {
              ScaffoldState _state = context.findAncestorStateOfType<ScaffoldState>();
              _state.showSnackBar(
                SnackBar(
                  content: Text("我是snakeBar1"),
                )
              );
            },
          ),
        ],
      )),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('_CounterState.didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('_CounterState.deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('_CounterState.dispose');
  }
}
