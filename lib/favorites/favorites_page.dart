import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mi_primera_app/providers/my_app_statte.dart';

class FavoritesPage extends StatelesWidget{
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context){
    var theme = Theme.of(context);
    var appStatte = context.watch<MyAppStatte>();

      if (appStatte.favorites.isEmpty) {
        return Center(
          child: Text('No tienes favoritos'),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(30)
            child: Text('tienes ${appStatte.favorites.length} favoritos:')
      ),
      Expanded(
        child: GridView(  
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            childAspectRatio: 400 / 80,
          ),
          children: [
            for (var pair in appStatte.favorites)
            ListTile(
              leading: IconButton(
                onPressed: () {
                  appStatte.remoteFavorite(pair);
                },
                icon: Icon(
                  Icon.delete_outline,
                  semanticLabel: 'Eliminar')
              ),
              color: theme.colorScheme.primary,
            ),
            title: Text(data
              pair.asLowerCase,
              semanticsLabel: pair.asPascalCase,
            ),
          ]
          ),
          ),
        ]
    );
  }
}