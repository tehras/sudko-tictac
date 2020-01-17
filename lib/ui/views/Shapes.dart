import 'package:flutter/cupertino.dart';
import 'package:ticdoku/res/Colors.dart';
import 'package:ticdoku/utils/ShapeTypeHelper.dart';

class Shape extends StatelessWidget {
  final double size;
  final ShapeType shapeType;
  final int rotation;

  const Shape({Key key, this.size, this.shapeType, this.rotation = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShapeGrid shapeGrid = ShapeTypeHelper.toShapeGrid(shapeType, rotation);

    return CustomPaint(
      painter: _ShapePainter(shapeGrid, size),
      child: Container(
        height: size * shapeGrid.height(),
        width: size * shapeGrid.width(),
      ),
    );
  }
}

enum ShapeType {
  I, // ----
  O, // [ ]
  T, // T
  J, // _|
  L, // |_
  S, // _|-
  Z // -|_
}

class _ShapePainter extends CustomPainter {
  final ShapeGrid shape;
  final double gridSize;

  _ShapePainter(this.shape, this.gridSize);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = ShapeColors.color;

    final Paint outsidePaint = Paint();
    outsidePaint.color = ShapeColors.outsideColor;
    outsidePaint.style = PaintingStyle.stroke;
    outsidePaint.strokeWidth = 2;

    for (int i = 0; i < shape.points.length; i++) {
      ShapeGridPoint point = shape.points[i];

      double left = point.x * gridSize;
      double right = (point.x + 1) * gridSize;
      double top = (point.y + 1) * gridSize;
      double bottom = (point.y) * gridSize;

      RRect outside = RRect.fromLTRBR(
        left,
        top,
        right,
        bottom,
        Radius.circular(4),
      );

      canvas.drawRRect(outside, paint);
      canvas.drawRRect(outside, outsidePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class ShapeGrid {
  final int rotation;
  final List<ShapeGridPoint> points;

  ShapeGrid(this.points, {this.rotation = 0});

  int width() {
    int maxX = 0;

    for (int i = 0; i < points.length; i++) {
      ShapeGridPoint point = points[i];

      if (point.x > maxX) {
        maxX = point.x;
      }
    }

    return maxX + 1;
  }

  int height() {
    int minY = 0;
    int maxY = 0;

    for (int i = 0; i < points.length; i++) {
      ShapeGridPoint point = points[i];

      if (point.y < minY) {
        minY = point.y;
      }

      if (point.y > maxY) {
        maxY = point.y;
      }
    }

    return maxY - minY + 1;
  }
}

class ShapeGridPoint {
  final int x;
  final int y;

  ShapeGridPoint(this.x, this.y);
}
