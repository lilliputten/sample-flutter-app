import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'package:flaming_quotes/features/Quote/helpers/fetchQuote.dart';
import 'package:flaming_quotes/features/Quote/types/Quote.dart';

class MyAppState extends ChangeNotifier {
  /// Word pair & hostory (a demo)
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

  /// Favorites list (a demo)
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

  /// Quote
  Future<Quote>? futureQuote;

  loadQuote() {
    futureQuote = fetchQuote();
    return futureQuote;
  }

  ensureQuote() {
    futureQuote ??= loadQuote();
    return futureQuote;
  }

  reloadQuote() {
    loadQuote();
    notifyListeners();
  }
}
