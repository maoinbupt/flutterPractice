import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class RandomWordsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final word = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(word.toString()),
    );
  }

  ///加载 assets
  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/config.json');
  }

  // Widget build(BuildContext context) {
  //   return Image.asset('graphics/background.png');
  // }
}