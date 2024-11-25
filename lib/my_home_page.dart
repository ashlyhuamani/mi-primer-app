import 'package:flutter/material.dart';
import 'package:mi_primera_app/providers/my_app_statte.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appStatte = context.watch<MyAppStatte>();
    return Scaffold(
      body: Column(
        children: [
          const Text('A random idea:'),
          Text(appStatte.current.asLowerCase)
        ],
      ),
    );
  }
}