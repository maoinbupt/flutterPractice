import 'package:flutter/material.dart';
import 'package:flutter_app2/a_first_flutter_app/new_rout.dart';
import 'package:flutter_app2/a_first_flutter_app/random_words_widget.dart';
import 'package:flutter_app2/b_basic_component/a_widget_basic/b_text.dart';
import 'package:flutter_app2/b_basic_component/a_widget_basic/c_button.dart';
import 'package:flutter_app2/b_basic_component/a_widget_basic/counter_widget.dart';
import 'package:flutter_app2/b_basic_component/a_widget_basic/d_image.dart';
import 'package:flutter_app2/b_basic_component/a_widget_basic/e_listview.dart';

import 'b_basic_component/a_widget_basic/f_gesture_drag.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),

      /// 注册路由routes
      routes: {
        "new_route_page": (context) => NewRoute(text: "main page"),
        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page3'),
      },
      onGenerateRoute: (RouteSettings settings) {
        String routeName = settings.name;

        ///TODO 判断业务进行跳转
        return null;
      },
      //home: MyHomePage(title: 'Flutter Demo Home Page3'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter += 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RandomWordsWidget(),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () async {
                //导航到新页面
                var result =
                    await Navigator.pushNamed(context, "new_route_page");
                // var result = await Navigator.push(context, MaterialPageRoute(
                //   builder: (context){
                //     return NewRoute(
                //         text: "main page",
                //     );
                //   }
                // ));
                print(result);
              },
            ),
            FlatButton(
                onPressed: () {
                  // debugDumpApp();
                  debugDumpRenderTree();
                },
                textColor: Colors.blue,
                child: Text('debugDumpRenderTree')),
            FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CounterWidget(initValue: 5,);
                  }));
                },
                textColor: Colors.blue,
                child: Text('State lifeCycle')),
            FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TextWidget();
                  }));
                },
                textColor: Colors.blue,
                child: Text('Text style')),
            FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ButtonWidget();
                  }));
                },
                textColor: Colors.blue,
                child: Text('button')),
            FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ImageWidget();
                  }));
                },
                textColor: Colors.blue,
                child: Text('img')),
            FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ListViewWidget();
                  }));
                },
                textColor: Colors.blue,
                child: Text('list')),
            FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GestureDetectorDragWidget();
                  }));
                },
                textColor: Colors.blue,
                child: Text('gesture')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
