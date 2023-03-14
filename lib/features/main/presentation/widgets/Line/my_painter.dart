import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/sourse/line_container_sourse.dart';

class MyPainter extends CustomPainter {
  int delta = 50;
  double width;
  int height;
  ElementEntity elementEntity;
  //BuildContext context;

  //double scale;
  LineContainerSourse lineContainerSourse = LineContainerSourse();

  MyPainter(
      {required this.height, required this.width, required this.elementEntity});

  void update(double widht, int height) {
    this.width = widht;
    this.height = height;
  }

  void drawCuts(Canvas canvas, Size size, List<ElementEntity> enitities) {
    //print('count entities ${enitities.length}');
    ScaleParams scaleParams = lineContainerSourse.getScalePoint(size.width);

    for (var cut in elementEntity.lineEntity.cuts) {
      Paint paint = Paint();
      paint.color = Colors.black;
      double x1 = cut.pointsMap[PositionCut.left]!;
      double y1 = 0;

      double x2 = cut.pointsMap[PositionCut.left]!;
      double y2 = 100;

      var start = Offset(
          (x1 * AllData.getInstance().scaleTimeLine) - scaleParams.start, y1);
      var end = Offset(
          (x2 * AllData.getInstance().scaleTimeLine) - scaleParams.start, y2);
      if (start.dx > 0 && start.dx < size.width)
        canvas.drawLine(start, end, paint);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    //print(size);
    Path path = Path();
    Paint paint = Paint();

    paint.color = Colors.red;
    final delta_ = width / 15;
    paint.strokeWidth = 0.45;

    ScaleParams scaleParams = lineContainerSourse.getScalePoint(width);

    for (int i = 0; i < scaleParams.countLines; i++) {
      double x1 = i * scaleParams.delta.value;
      double y1 = 0;

      double x2 = i * scaleParams.delta.value;
      double y2 = 50;

      double minus_x = scaleParams.start;

      var start = Offset(x1 - minus_x, y1);
      var end = Offset(x2 - minus_x, y2);

      if (start.dx > 0 && start.dx < size.width)
        canvas.drawLine(start, end, paint);
    }
    var entities = AllData.getInstance().elementEntities;
    drawCuts(canvas, size, entities);
    path.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
