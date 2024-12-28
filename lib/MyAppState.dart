import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'Quote/Quote.dart';
import 'Quote/fetchQuote.dart';
import 'helpers/fetchGoogleImage.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var history = <WordPair>[];

  GlobalKey? historyListKey;

  void getNext() {
    history.insert(0, current);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite([WordPair? pair]) {
    pair = pair ?? current;
    if (favorites.contains(pair)) {
      favorites.remove(pair);
    } else {
      favorites.add(pair);
    }
    notifyListeners();
  }

  void removeFavorite(WordPair pair) {
    favorites.remove(pair);
    notifyListeners();
  }

  bool quoteInitialized = false;
  late Future<Quote> futureQuote;
  bool imgUrlInitialized = false;
  String imgUrl = '';
  late Future<String> futureImgUrl;
  // Future<Quote>? futureQuote;

  loadQuote() {
    // TODO: Return loaded quote
    imgUrlInitialized = false;
    futureQuote = fetchQuote();
    futureQuote.then((quote) {
      futureImgUrl = fetchGoogleImage(quote.author);
      imgUrlInitialized = true;
      // notifyListeners();
      futureImgUrl.then((url) {
        print("Image url: $url");
        imgUrl = url;
        // notifyListeners();
      });
    });
    quoteInitialized = true;
    // notifyListeners();
    return futureQuote;
  }

  // loadQuote()

  // @override
  // void initState() {
  //   super.initState();
  //   futureQuote = fetchQuote();
  // }
}
