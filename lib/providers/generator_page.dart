
import 'package:flutter/material.dart';
import 'package:mi_primera_app/history/history_list_view.dart';
import 'package:provider/provider.dart';
import 'package:mi_primera_app/providers/big_card.dart';
import 'package:mi_primera_app/providers/my_app_statte.dart';

class GeneratorPage extends StatelessWidget{
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appStatte = context.watch<MyAppStatte>();
    var pair = appStatte.current;
    IconData icon;
    if (appStatte.favorites.contains(pair)) {
      icon = Icon.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: HistoryListView(),
          ),
          SizedBox(height: 10,),
          BigCard(pair: pair),
          SizedBox(height: 10,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appStatte.toogleFavorite(pair);
                },
                icon: Icon(icon),
                label: Text('Me gusta'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appStatte.getNext();
                },
                child: Text('Siguiente'),
              ),
            ],
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}