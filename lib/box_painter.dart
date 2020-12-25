import 'package:flutter/material.dart';

class RectCanvas extends StatelessWidget {
  final double borderWidth;
  const RectCanvas({
    Key key,
    this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ThePaintingThing(borderWidth: borderWidth),
      size: Size(MediaQuery.of(context).size.width / 2,
          MediaQuery.of(context).size.width / 2),
    );
  }
}

class ThePaintingThing extends CustomPainter {
  final double borderWidth;
  ThePaintingThing({this.borderWidth = 5.0});
  @override
  void paint(Canvas canvas, Size size) {
    final _rectangle = Rect.fromLTRB(0, 0, size.width, size.height);
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5.0;
    final outlinePaint = Paint()
      ..color = Colors.blue[800]
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;
    canvas.drawRect(_rectangle, paint);
    canvas.drawRect(_rectangle, outlinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
