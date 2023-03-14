import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/sourse/convet_simbol_num.dart';
import 'package:flutter_universalprogram/features/main/domain/sourse/line_container_sourse.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:math_expressions/math_expressions.dart';

enum PositionCut { left, width, right }

class LineEntity {
  RxList<Cut> cuts = RxList([
    Cut(
      id: 0,
      pointsMap_: {
        PositionCut.left: 0.0,
        PositionCut.width: 12.0,
        PositionCut.right: 10
      },
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(0.3),
    )
  ]);

  late double scale = 1;

  void updateCuts(double width) {
    LineContainerSourse lineContainer = LineContainerSourse();
    var rightCut = lineContainer.foundRightCut(cuts);
    var left = rightCut.pointsMap[PositionCut.left];
    rightCut.pointsMap[PositionCut.width] = width - left!;
    rightCut.pointsMap[PositionCut.right] = width;
  }

  void addCut(double pos) {
    double width = 200;
    LineContainerSourse lineContainer = LineContainerSourse();
    cuts.value = lineContainer.getCalculateCuts(cuts.value, width, pos);
    print('add cut + ${cuts.length}');
  }

  //List<Cut> get cuts => _cuts;
}

class Cut {
  int id;
  Color? color;
  String? function;
  double _realValue = 0.0;

  double get start {
    var res = ((pointsMap[PositionCut.left]!) * 5 / 67.1);
    return res;
  }

  double realVelue(int a) {
    ContextModel cm = ContextModel();
    var variablesLst = AllData.getInstance().reservedVariables;

    cm.bindVariable(
        Variable('t'), Number(AllData.getInstance().currentTime.value));

    for (var i in variablesLst) {
      //print('var: ${i.name}');
      i.name = correctString(i.name!);
      i.function = correctString(i.function!);
      if (function?.contains(i.name!) ?? false) {
        i.name = correctString(i.name!);

        Variable varibleTmp = Variable(i.name!);
        var value = i.value1;
        cm.bindVariable(varibleTmp, Number(value.value));
      }
    }

    Parser p = Parser();

    Expression exp = p.parse(function ?? '0');

    double y = exp.evaluate(EvaluationType.REAL, cm);
    _realValue = y;

    return _realValue;
  }

  Map<PositionCut, double>? pointsMap_;
  Cut({required this.id, this.pointsMap_, this.color});

  Map<PositionCut, double> get pointsMap {
    return pointsMap_ ??
        {PositionCut.left: 10, PositionCut.width: 100, PositionCut.right: 100};
  }

  set pointsMap(Map<PositionCut, double> currentMap) {
    pointsMap_ = currentMap;
  }
}
