import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/sourse/line_container_sourse.dart';
import 'package:flutter_universalprogram/features/main/presentation/bloc/main_bloc.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/Line/cuts/defaul_cut_widget.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/Line/dial_widget.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/Line/my_painter.dart';

class TimeLineWidget extends StatelessWidget {
  ElementEntity elementEntity;
  double clickPosition = 0;
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
            },
            child: CustomPaint(
              painter: MyPainter(
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

Widget stackBuilder(double width, ElementEntity elementEntity) {
  List<Widget> widgets = [];

  var start = LineContainerSourse().getScalePoint(width).start;
  var delta = LineContainerSourse().getScalePoint(width).delta;
  var countLines = LineContainerSourse().getScalePoint(width).countLines;

  widgets = dialWidget(
      delta: delta,
      start: start,
      width: width,
      widgets: widgets,
      countLines: countLines);

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
