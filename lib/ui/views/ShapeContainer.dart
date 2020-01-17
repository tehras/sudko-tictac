
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticdoku/utils/ShapeGenerator.dart';

import 'Shapes.dart';

class ShapeContainer extends StatefulWidget {
  final int gridSize;

  const ShapeContainer({Key key, this.gridSize}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShapeContainerWidget(gridSize);
  }
}

class _ShapeContainerWidget extends State<StatefulWidget> {
  final int gridSize;
  ShapeType _shapeType = ShapeGenerator.generateRandomShapeType(null);

  void _newShapeType() {
    setState(() {
      _shapeType = ShapeGenerator.generateRandomShapeType(_shapeType);
    });
  }

  _ShapeContainerWidget(this.gridSize);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double tileSize =
        (min(screenSize.height, screenSize.width) - 32) / gridSize;

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _newShapeType,
          ),
          Container(
            height: tileSize * 4,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Shape(
                    size: tileSize,
                    shapeType: _shapeType,
                  ),
                  Shape(
                    size: tileSize,
                    shapeType: _shapeType,
                    rotation: 90,
                  ),
                  Shape(
                    size: tileSize,
                    shapeType: _shapeType,
                    rotation: 270,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}