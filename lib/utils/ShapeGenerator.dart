import 'dart:math';

import 'package:ticdoku/ui/views/Shapes.dart';

class ShapeGenerator {
  static ShapeType generateRandomShapeType(ShapeType current) {
    var rng = new Random();

    ShapeType newType = ShapeType.values[rng.nextInt(6)];

    while (newType == current) {
      newType = ShapeType.values[rng.nextInt(6)];
    }

    return newType;
  }
}
