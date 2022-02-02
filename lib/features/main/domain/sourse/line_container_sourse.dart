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
    var scaleParams = ScaleParams(
        countLines: 30 ~/ scale, delta: (width / 15) * scale, start: start);

    return scaleParams;
  }
}
