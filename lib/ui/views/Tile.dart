import 'package:flutter/material.dart';
import 'package:ticdoku/res/Colors.dart';

class Tile extends StatelessWidget {
  final TileType tileType;
  final double size;

  const Tile({
    Key key,
    this.tileType = TileType.Primary,
    this.size = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TilePainter(
        insideColor: _getInsideColor(),
        outsideColor: TileColors.border,
      ),
      child: Container(
        height: size,
        width: size,
      ),
    );
  }

  Color _getInsideColor() {
    if (tileType == TileType.Primary) {
      return TileColors.insidePrimary;
    } else {
      return TileColors.insideSecondary;
    }
  }
}

enum TileType { Primary, Secondary }

class _TilePainter extends CustomPainter {
  final Color insideColor;
  final Color outsideColor;

  _TilePainter({
    this.insideColor,
    this.outsideColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint insidePaint = Paint();
    insidePaint.color = insideColor;

    final Paint outsidePaint = Paint();
    outsidePaint.color = outsideColor;
    outsidePaint.style = PaintingStyle.stroke;
    outsidePaint.strokeWidth = 2;

    final RRect outside = RRect.fromLTRBR(
      0,
      size.height,
      size.width,
      0,
      Radius.circular(4),
    );

    canvas.drawRRect(outside, insidePaint);
    canvas.drawRRect(outside, outsidePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
