import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ImageState();
  }
}

class ImageState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var img = AssetImage("imgs/avatar.png");
    return Scaffold(
      appBar: AppBar(
        title: Text("img style"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Image>[
              Image(
                image: img,
                width: 100.0,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.cover, //scaleType类似
              ),
              Image.asset(
                "imgs/avatar.png",
                width: 100.0,
                color: Colors.blue,
                colorBlendMode: BlendMode.difference,
                height: 200.0,
                repeat: ImageRepeat.repeatY,
              ),
              Image(
                image: NetworkImage(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                width: 100.0,
              ),
            ].map((e) {
              return Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 100,
                      child: e,
                    ),
                  ),
                  Text(e.fit.toString())
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
