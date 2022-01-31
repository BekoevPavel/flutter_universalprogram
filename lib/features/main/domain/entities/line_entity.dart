class LineEntity {
  List<Cut> cuts = [];
  late int id;
  late double scale = 1;
  LineEntity({required int lastId}) {
    id = lastId + 1;
  }

  void addCut(double left, double right) {
    Cut cut = Cut(lastId: cuts.length);
    cut.setPoints(left, right);
    cuts.add(cut);
  }

  void addCuts(List<Cut> cuts) {
    this.cuts = cuts;
  }
}

class Cut {
  late int _id;

  final Map<String, double> _pointsMap = {
    'Left': 0,
    'Right': 0,
  };
  Cut({required int lastId}) {
    _id = lastId + 1;
  }

  void setPoints(double left, double right) {
    _pointsMap['Left'] = left;
    _pointsMap['Right'] = right;
  }

  Map<String, double> get pointsMap {
    return _pointsMap;
  }

  int get id {
    return _id;
  }
}
