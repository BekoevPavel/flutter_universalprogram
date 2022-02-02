import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';

import 'package:flutter_universalprogram/features/main/domain/sourse/line_container_sourse.dart';
import 'package:flutter_universalprogram/features/main/presentation/bloc/main_bloc.dart';
import 'package:flutter_universalprogram/main.dart';

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
        child: GestureDetector(
          onDoubleTap: () => print('DoubleTap'),
          onTapDown: (data) {
            MainBloc mainBloc = BlocProvider.of<MainBloc>(context);
            var allData = AllData.getInstance();
            var index = allData.elementEntities.length;
            //print('lenght  ${index}');
            var entity = allData.elementEntities[index - 1];
            //var oldCut = entity.lineEntity.cuts[]

            entity.lineEntity?.addCut(data.localPosition.dx);

            //print('${entity.lineEntity!.cuts[0].pointsMap}');

            mainBloc.add(UpdateOaintBoardEvent());
          },
          child: CustomPaint(
              painter: CurvePainter(
                height: 100,
                width: 700,
              ),
              child: stackBuilder()),
        ),
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

  void drawCuts(Canvas canvas, Size size, List<ElementEntity> enitities) {
    print('draw Cuts');

    for (var entity in enitities) {
      print('entity id ${entity.id}');
      for (var cut in entity.lineEntity!.cuts) {
        Paint paint = Paint();
        paint.color = Colors.black54;
        double x1 = cut.pointsMap['Right']!;
        double y1 = 0;

        double x2 = cut.pointsMap['Right']!;
        double y2 = 100;

        var start = Offset(x1, y1);
        var end = Offset(x2, y2);
        canvas.drawLine(start, end, paint);
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    print('Draw');
    Path path = Path();
    Paint paint = Paint();

    paint.color = Colors.red;
    final delta_ = width / 15;
    paint.strokeWidth = 1;

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

Widget stackBuilder() {
  List<Widget> widgets = [];

  for (int i = 0;
      i < LineContainerSourse().getScalePoint(700).countLines;
      i++) {
    var textWidget = Positioned(
      left: i * LineContainerSourse().getScalePoint(700).delta -
          LineContainerSourse().getScalePoint(700).start,
      bottom: 10,
      child: Text('${i * 5}'),
    );

    widgets.add(textWidget);
  }

  var functionWidget = Positioned(
    left: 150,
    child: Container(
      padding: const EdgeInsets.all(8),
      width: 100,
      height: 100,
      color: Colors.black26,
      child: Center(
        child: TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            labelText: 'Функция *',
            hintText: 'Введите функцию',
          ),
        ),
      ),
    ),
  );
  widgets.add(functionWidget);

  return Stack(
    children: widgets,
  );
}
