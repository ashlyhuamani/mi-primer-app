import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyAppStatte with ChangeNotifier{
  var current = WordPair.random();
  var history = <WordPair>[];
  GlobalKey? historyListKey;

  void getNext() {
    history.insert(0, current);
    var animatedList = historyListKey?.currentState as AnimatedListState;
    animatedList.insertItem(0);
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toogleFavorite(WordPair? pair){
    pair = pair ?? current;
    if(favorites.contains(pair)){
      favorites.remove(pair);
    }else {
      favorites.add(pair);
    }
    notifyListeners();
  }

  void remoteFavorite(WordPair? pair){
    favorites.remove(pair);
    notifyListeners();
  }

}