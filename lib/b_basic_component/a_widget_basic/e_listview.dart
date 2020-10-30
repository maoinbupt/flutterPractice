import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatefulWidget {
  @override
  State<ListViewWidget> createState() {
    return ListViewState();
  }
}

class ListViewState extends State<ListViewWidget> {
  static const loadingTag = "##LOADING##";
  var _words = <String>[loadingTag];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("list"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            if (loadingTag == _words[index]) {
              if (_words.length - 1 < 100) {
                //展示loading
                _requestData();
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                    ),
                  ),
                );
              } else {
                //没有更多
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "没有更多了",
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }
            }
            return ListTile(
              title: Text(_words[index]),
            );
          },
          separatorBuilder: (context, index) =>
              // Divider(height: .0),
              Container(height: 1, color: Color(0xf0f0f0)),
          itemCount: _words.length),
    );
  }

  _requestData() {
    Future.delayed(Duration(seconds: 2)).then((result) {
      setState(() {
        _words.insertAll(_words.length - 1,
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      });
    });
  }
}
