import 'package:flutter_universalprogram/features/main/domain/sourse/line_container_sourse.dart';

enum PositionCut { left, width, right }

class LineEntity {
  List<Cut> _cuts = [
    Cut(
      id: 0,
      pointsMap_: {
        PositionCut.left: 0.0,
        PositionCut.width: 12.0,
        PositionCut.right: 10
      },
    ),
  ];
  late double scale = 1;

  void updateCuts(double width) {
    LineContainerSourse lineContainer = LineContainerSourse();
    var rightCut = lineContainer.foundRightCut(cuts);
    var left = rightCut.pointsMap[PositionCut.left];
    rightCut.pointsMap[PositionCut.width] = width - left!;
    rightCut.pointsMap[PositionCut.right] = width;
    print('width ${cuts.length}');
  }

  void addCut(double pos) {
    double width = 200;
    LineContainerSourse lineContainer = LineContainerSourse();
    _cuts = lineContainer.getCalculateCuts(cuts, width, pos);

    // Cut cut = Cut(
    //   id: _cuts.length,
    //   pointsMap_: {
    //     PositionCut.left: pos,
    //     PositionCut.width: width,
    //     PositionCut.right: pos + width
    //   },
    // );
    // _cuts.add(cut);
  }

  List<Cut> get cuts => _cuts;
}

class Cut {
  int id;

  Map<PositionCut, double>? pointsMap_;
  Cut({required this.id, this.pointsMap_});

  Map<PositionCut, double> get pointsMap {
    return pointsMap_ ??
        {PositionCut.left: 10, PositionCut.width: 100, PositionCut.right: 100};
  }

  set pointsMap(Map<PositionCut, double> currentMap) {
    pointsMap_ = currentMap;
  }
}
