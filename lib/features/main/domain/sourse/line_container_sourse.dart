import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';

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
    var center = oldCut.pointsMap[PositionCut.left]! +
        oldCut.pointsMap[PositionCut.width]! / 2;
    var newCut = Cut(id: cuts.length);

    var right = oldCut.pointsMap[PositionCut.right];
    var left = oldCut.pointsMap[PositionCut.left];

    if (pos <= center) {
      oldCut.pointsMap = {
        PositionCut.left: pos,
        PositionCut.width: right! - pos,
        PositionCut.right: right
      };
      newCut.pointsMap = {
        PositionCut.left: left!,
        PositionCut.right: pos,
        PositionCut.width: pos - left
      };
    } else {
      oldCut.pointsMap = {
        PositionCut.right: pos,
        PositionCut.width: pos - left!,
        PositionCut.left: left
      };
      newCut.pointsMap = {
        PositionCut.left: pos,
        PositionCut.right: right!,
        PositionCut.width: right - pos
      };
    }
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
