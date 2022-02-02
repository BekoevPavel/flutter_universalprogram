import 'dart:async';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';

import 'package:flutter_universalprogram/features/main/domain/sourse/line_container_sourse.dart';
import 'package:flutter_universalprogram/features/main/presentation/bloc/main_bloc.dart';

class TimeLineWidget extends StatelessWidget {
  ElementEntity elementEntity;
  TimeLineWidget({Key? key, required this.elementEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: GestureDetector(
          onLongPress: () {},
          onTapDown: (data) {
            MainBloc mainBloc = BlocProvider.of<MainBloc>(context);
            var allData = AllData.getInstance();
            var index = allData.elementEntities.length;

            LineContainerSourse lineContainerSourse = LineContainerSourse();
            ScaleParams params = lineContainerSourse
                .getScalePoint(MediaQuery.of(context).size.width);
            var scale = AllData.getInstance().scaleTimeLine;
            var x = (data.localPosition.dx + params.start) / scale;
            elementEntity.lineEntity!.addCut(x);
            //print(MediaQuery.of(context).size.width.toString());
            //print(context.size!.width);

            mainBloc.add(UpdateOaintBoardEvent());
          },
          child: CustomPaint(
              painter: CurvePainter(
                context: context,
                elementEntity: elementEntity,
                height: 100,
                width: MediaQuery.of(context).size.width,
              ),
              child: stackBuilder(context)),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  int delta = 50;
  double width;
  int height;
  ElementEntity elementEntity;
  BuildContext context;

  //double scale;
  LineContainerSourse lineContainerSourse = LineContainerSourse();

  CurvePainter(
      {required this.context,
      required this.height,
      required this.width,
      required this.elementEntity});

  void update(double widht, int height) {
    this.width = widht;
    this.height = height;
  }

  void drawCuts(Canvas canvas, Size size, List<ElementEntity> enitities) {
    //print('count entities ${enitities.length}');
    ScaleParams scaleParams = lineContainerSourse.getScalePoint(size.width);

    for (var cut in elementEntity.lineEntity!.cuts) {
      Paint paint = Paint();
      paint.color = Colors.black;
      double x1 = cut.pointsMap['Right']!;
      double y1 = 0;

      double x2 = cut.pointsMap['Right']!;
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

Widget stackBuilder(BuildContext context) {
  List<Widget> widgets = [];

  var start = LineContainerSourse()
      .getScalePoint(MediaQuery.of(context).size.width)
      .start;
  var delta = LineContainerSourse()
      .getScalePoint(MediaQuery.of(context).size.width)
      .delta;
  var countLines = LineContainerSourse()
      .getScalePoint(MediaQuery.of(context).size.width)
      .countLines;

  for (int i = 0; i < countLines; i++) {
    var textWidget = Positioned(
      left: i * delta - start,
      bottom: 10,
      child: Text('${i * 5}'),
    );
    //double? width = context.size?.width ?? 600;
    //if (context.size != null) print('context: ' + context.size.toString());
    //print('width ' + MediaQuery.of(context).size.width.toString());
    //print('x: ${i * delta - start} width ${MediaQuery.of(context).size.width}');

    if (i * delta - start > 0 &&
        i * delta - start < MediaQuery.of(context).size.width - 210)
      widgets.add(textWidget);
  }
  var maxLenght = countLines * delta;
  var functionWidget = Positioned(
    left: -start,
    child: Opacity(
      opacity: 0.8,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: maxLenght,
        height: 100,
        color: Colors.black38,
        child: Center(
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.green, width: 2),
              ),
              labelText: 'Функция *',
              hintText: 'Введите функцию',
            ),
          ),
        ),
      ),
    ),
  );
  //widgets.add(functionWidget);

  return Stack(
    children: widgets,
  );
}
