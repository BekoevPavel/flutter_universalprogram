import 'package:flutter/material.dart';

class TimeLineWidget extends StatelessWidget {
  const TimeLineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(
            color: Colors.green,
          ),
        ),
        child: CustomPaint(
          painter: CurvePainter(height: 100, width: 700),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  int delta = 50;
  int? width;
  int? height;

  CurvePainter({@required this.height, required this.width});

  void update(int widht, int height) {
    this.width = widht;
    this.height = height;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    paint.color = Colors.red;
    final delta_ = width! / 10;
    paint.strokeWidth = 1;

    for (int i = 0; i < 10; i++) {
      canvas.drawLine(Offset(i * delta_.toDouble(), 0),
          Offset(i * delta_.toDouble(), 100), paint);
    }
    path.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
