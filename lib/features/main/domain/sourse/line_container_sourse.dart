import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';

class ScaleParams {
  int countLines;
  double delta;
  ScaleParams({required this.countLines, required this.delta});
}

class LineContainerSourse {
  List<LineEntity>? _lineEntities;

  ScaleParams getScalePoint(double width) {
    var scale = AllData.getInstance().scaleTimeLine;
    var scaleParams =
        ScaleParams(countLines: 30 ~/ scale, delta: (width / 15) * scale);

    return scaleParams;
  }
}
