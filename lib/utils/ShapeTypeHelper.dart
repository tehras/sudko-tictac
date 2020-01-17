import 'package:ticdoku/ui/views/Shapes.dart';

class ShapeTypeHelper {
  static ShapeGrid toShapeGrid(ShapeType shapeType, int rotation) {
    if (rotation != 0 && rotation != 90 && rotation != 180 && rotation != 270) {
      throw Exception("Only right angles are allowed");
    }

    List<ShapeGridPoint> points = List<ShapeGridPoint>();

    // input -> x, y -> y, -x

    switch (shapeType) {
      case ShapeType.I:
        points.add(ShapeGridPoint(0, 0));
        points.add(ShapeGridPoint(1, 0));
        points.add(ShapeGridPoint(2, 0));
        points.add(ShapeGridPoint(3, 0));
        break;
      case ShapeType.O:
        points.add(ShapeGridPoint(0, 0));
        points.add(ShapeGridPoint(0, 1));
        points.add(ShapeGridPoint(1, 0));
        points.add(ShapeGridPoint(1, 1));
        break;
      case ShapeType.T:
        points.add(ShapeGridPoint(1, 0));
        points.add(ShapeGridPoint(0, 1));
        points.add(ShapeGridPoint(1, 1));
        points.add(ShapeGridPoint(2, 1));
        break;
      case ShapeType.J:
        points.add(ShapeGridPoint(0, 0));
        points.add(ShapeGridPoint(0, 1));
        points.add(ShapeGridPoint(1, 1));
        points.add(ShapeGridPoint(1, 2));
        break;
      case ShapeType.L:
        points.add(ShapeGridPoint(1, 0));
        points.add(ShapeGridPoint(0, 0));
        points.add(ShapeGridPoint(0, 1));
        points.add(ShapeGridPoint(0, 2));
        break;
      case ShapeType.S:
        points.add(ShapeGridPoint(0, 2));
        points.add(ShapeGridPoint(0, 1));
        points.add(ShapeGridPoint(1, 1));
        points.add(ShapeGridPoint(1, 0));
        break;
      case ShapeType.Z:
        points.add(ShapeGridPoint(0, 0));
        points.add(ShapeGridPoint(0, 1));
        points.add(ShapeGridPoint(1, 1));
        points.add(ShapeGridPoint(1, 1));
        break;
    }

    ShapeGrid original = ShapeGrid(points);
    return _rotate(original, rotation);
  }

  static ShapeGrid _rotate(ShapeGrid original, int rotation) {
    switch (rotation) {
      case 0:
        return original;
      case 90:
        return _rotate90(original);
      case 180:
        return _rotate180(original);
      case 270:
        return _rotate270(original);
    }

    return original;
  }

  static ShapeGrid _rotate90(ShapeGrid original) {
    int offset = original.height() - 1;
    return ShapeGrid(original.points
        .map((e) => ShapeGridPoint(-e.y + offset, e.x))
        .toList());
  }

  static ShapeGrid _rotate180(ShapeGrid original) {
    int xOffset = original.width() - 1;
    int yOffset = original.height() - 1;
    return ShapeGrid(original.points
        .map((e) => ShapeGridPoint(-e.x + xOffset, -e.y + yOffset))
        .toList());
  }

  static ShapeGrid _rotate270(ShapeGrid original) {
    int offset = original.width() - 1;
    return ShapeGrid(original.points
        .map((e) => ShapeGridPoint(e.y, -e.x + offset))
        .toList());
  }
}
