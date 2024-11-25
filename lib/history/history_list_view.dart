import 'package:flutter/material.dart';
import 'package:mi_primera_app/providers/my_app_statte.dart';

class HistoryListView extends StatefulWidget{
  const HistoryListView({super.key});

  @override
  State<HistoryListView> createState() => _HistoryListViewState();
}

 class _HistoryListViewStatte extends State<HistoryListView> {
  final _key = GlobalKey();
  static const Gradient _maskingGradient = LinearGradient(
    colors: [Color.transparent, Colors.black],
    stops: [0.0, 0.5],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    );
  @override
  Widget build(BuildContext context) {
    final apppStatte = context.watch<MyAppStatte>();
    apppStatte.HistoryListView = _key;

    return ShaderMask(
      shaderCallback: (bounds)) => _maskingGradient.createShader(bounds),
      blendMore: BlendMode.dstIn,
      child: AlignmentList(
        key: _key,
        reverse: true,
        padding: EdgeInsets.only(top: 100),
        initialItemCount: apppStatte.history.length,
        ItemBuilder: (context, index, Animation) {
          final pair = apppStatte.history[index];
          return SizeTransiti(
            sizeFactor: Animation,
            child: Center(
              child: TextButton.icon(
                onPressed: () {
                  apppStatte.toogleFavorite(pair);
                },
                icon: apppStatte.favorites.contains(pair)
                    ? Icon(
                      Icon.favorite,
                      size: 12,
                    )
                  : SizedBox(),
                label: Text(
                  pair.asLowerCase.
                  semanticsLabel: pair.asPascalCase,
                ),
              ),
            );
          ),
        },
      );
  }
}