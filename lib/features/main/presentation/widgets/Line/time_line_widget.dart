import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';

import 'package:flutter_universalprogram/features/main/domain/sourse/line_container_sourse.dart';
import 'package:flutter_universalprogram/features/main/presentation/bloc/main_bloc.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/Line/defaul_cut_widget.dart';

class TimeLineWidget extends StatelessWidget {
  ElementEntity elementEntity;
  late double clickPosition;
  TimeLineWidget({Key? key, required this.elementEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(child: LayoutBuilder(
      builder: (BuildContext context, constraints) {
        elementEntity.lineEntity.updateCuts(constraints.maxWidth);
        return Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: GestureDetector(
            onTapDown: (data) {
              clickPosition = data.localPosition.dx;
            },
            onDoubleTap: () {
              MainBloc mainBloc = BlocProvider.of<MainBloc>(context);
              var width = constraints.maxWidth;

              mainBloc.add(
                AddCutOnBoardEvent(
                    width: width,
                    elementEntity: elementEntity,
                    dx: clickPosition),
              );
              print('tt');
            },
            child: CustomPaint(
              painter: CurvePainter(
                elementEntity: elementEntity,
                height: 100,
                width: constraints.maxWidth,
              ),
              child: stackBuilder(
                constraints.maxWidth,
                elementEntity,
              ),
            ),
          ),
        );
      },
    ));
  }
}

class CurvePainter extends CustomPainter {
  int delta = 50;
  double width;
  int height;
  ElementEntity elementEntity;
  //BuildContext context;

  //double scale;
  LineContainerSourse lineContainerSourse = LineContainerSourse();

  CurvePainter(
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
      double x1 = i * scaleParams.delta;
      double y1 = 0;

      double x2 = i * scaleParams.delta;
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

Widget stackBuilder(double width, ElementEntity elementEntity) {
  List<Widget> widgets = [];

  var start = LineContainerSourse().getScalePoint(width).start;
  var delta = LineContainerSourse().getScalePoint(width).delta;
  var countLines = LineContainerSourse().getScalePoint(width).countLines;

  for (int i = 0; i < countLines; i++) {
    var textWidget = Positioned(
      left: i * delta - start,
      bottom: 10,
      child: Text('${i * 5}'),
    );
    if (i * delta - start > 0 && i * delta - start < width)
      widgets.add(textWidget);
  }

  for (var cut in elementEntity.lineEntity.cuts) {
    var functionWidget = DefaultCutWidget(
      cut: cut,
      delta: start,
    );
    widgets.add(functionWidget);
  }

  return Stack(
    children: widgets,
  );
}
