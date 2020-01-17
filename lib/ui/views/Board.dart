import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Tile.dart';

class Board extends StatelessWidget {
  final int gridSize;

  const Board({Key key, this.gridSize = 9}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> columns = List<Widget>();
    for (var i = 0; i < gridSize; i++) {
      bool isPrimary = i % 2 == 0;

      columns.add(_TileRow(size: gridSize, startPrimary: isPrimary));
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: columns,
      ),
    );
  }
}

class _TileRow extends StatelessWidget {
  final int size;
  final bool startPrimary;

  const _TileRow({Key key, this.size, this.startPrimary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double tileSize = (min(screenSize.height, screenSize.width) - 32) / size;

    List<Widget> tiles = List<Widget>();
    for (var i = 0; i < size; i++) {
      bool isPrimary = startPrimary ? i % 2 == 0 : i % 2 != 0;

      tiles.add(Tile(
        tileType: isPrimary ? TileType.Primary : TileType.Secondary,
        size: tileSize,
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: tiles,
    );
  }
}
