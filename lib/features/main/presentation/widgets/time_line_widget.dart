import 'package:flutter/material.dart';

import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/sourse/line_container_sourse.dart';

class TimeLineWidget extends StatelessWidget {
  TimeLineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: CustomPaint(
            painter: CurvePainter(
              height: 100,
              width: 700,
            ),
            child: stackBuilder()),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  int delta = 50;
  double width;
  int height;
  //double scale;
  LineContainerSourse lineContainerSourse = LineContainerSourse();

  CurvePainter({required this.height, required this.width});

  void update(double widht, int height) {
    this.width = widht;
    this.height = height;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    print('width ${width}');

    paint.color = Colors.red;
    final delta_ = width / 15;
    paint.strokeWidth = 1;

    ScaleParams scaleParams = lineContainerSourse.getScalePoint(width);

    for (int i = 0; i < scaleParams.countLines; i++) {
      double x1 = i * scaleParams.delta;
      double y1 = 0;

      double x2 = i * scaleParams.delta;
      double y2 = 50;

      var start = Offset(x1, y1);
      var end = Offset(x2, y2);

      canvas.drawLine(start, end, paint);
    }
    path.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

Widget stackBuilder() {
  List<Widget> widgets = [];

  for (int i = 0;
      i < LineContainerSourse().getScalePoint(700).countLines;
      i++) {
    var widget = Positioned(
      left: i * LineContainerSourse().getScalePoint(700).delta,
      bottom: 10,
      child: Text('${i * 5}'),
    );
    widgets.add(widget);
  }

  return Stack(
    children: widgets,
  );
}
