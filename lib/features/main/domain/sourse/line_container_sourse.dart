import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';
import 'dart:math' as math;

class ScaleParams {
  int countLines;
  double delta;
  double start;
  ScaleParams(
      {required this.countLines, required this.delta, required this.start});
}

class LineContainerSourse {
  List<LineEntity>? _lineEntities;

  ScaleParams getScalePoint(double width) {
    var scale = AllData.getInstance().scaleTimeLine;
    var start = AllData.getInstance().scrollK;
    var scaleParams =
        ScaleParams(countLines: 100, delta: width / 20 * scale, start: start);
//120 ~/ scale countLines
//(width / 15) delta
    return scaleParams;
  }

  List<Cut> getCalculateCuts(List<Cut> cuts, double width, double pos) {
    var oldCut = _foundCutClicked(cuts, pos);
    var center = (oldCut.pointsMap[PositionCut.left]! +
            oldCut.pointsMap[PositionCut.width]! / 2)
        .abs();
    var newCut = Cut(id: cuts.length);

    var right = oldCut.pointsMap[PositionCut.right];
    var left = oldCut.pointsMap[PositionCut.left];

    if (pos <= center) {
      oldCut.pointsMap = {
        PositionCut.left: pos,
        PositionCut.right: right!,
        PositionCut.width: right - pos,
      };
      newCut.pointsMap = {
        PositionCut.left: left!,
        PositionCut.right: pos,
        PositionCut.width: pos - left
      };
    } else {
      newCut.pointsMap = {
        PositionCut.left: pos,
        PositionCut.right: right!,
        PositionCut.width: (right - pos).abs()
      };
      oldCut.pointsMap = {
        PositionCut.left: left!,
        PositionCut.right: pos,
        PositionCut.width: (pos - left).abs(),
      };
    }
    // for (var cut in cuts) {
    //   print('before id:${cut.id} map: ${cut.pointsMap}');
    // }

    newCut.color =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.3);

    cuts.add(newCut);

    return cuts;
  }

  Cut _foundCutClicked(List<Cut> cuts, double pos) {
    for (int i = 0; i < cuts.length; i++) {
      if (cuts[i].pointsMap[PositionCut.left]! < pos &&
          cuts[i].pointsMap[PositionCut.right]! > pos) {
        return cuts[i];
      }
    }
    return cuts[0];
  }

  Cut foundRightCut(List<Cut> cuts) {
    double maxRight = 0;
    int index = 0;
    for (int i = 0; i < cuts.length; i++) {
      if (cuts[i].pointsMap[PositionCut.right]! > maxRight) {
        maxRight = cuts[i].pointsMap[PositionCut.right]!;
        index++;
      }
    }
    return cuts[index - 1];
  }
}
