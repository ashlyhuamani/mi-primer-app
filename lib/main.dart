import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
// import 'package:mi_primera_app/my_home_page.dart';
// import 'package:mi_primera_app/providers/my_app_statte.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppStatte(),
      child: MaterialApp(
        title: 'Ticketya',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 174, 0)
          ),
          home: MyHomePage(),
      ),
    );
  }
}

class MyAppStatte extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var MyAppStatte = context.watch<MyAppStatte>();

    return Scaffold(
      body: Column(
        children: [
          Text('A random idea:'),
          Text(MyAppStatte.current.asLowerCase)
        ],
      ),
    )
  }
}