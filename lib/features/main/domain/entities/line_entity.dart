class LineEntity {
  List<Cut> _cuts = [];
  late double scale = 1;

  void addCut(double pos) {
    Cut cut = Cut(id: _cuts.length, pointsMap_: {'Left': 0, 'Right': pos});
    _cuts.add(cut);
  }

  void addCuts(List<Cut> cuts) {
    this._cuts = cuts;
  }

  List<Cut> get cuts {
    return _cuts;
  }
}

class Cut {
  int id;

  Map<String, double>? pointsMap_;
  Cut({required this.id, this.pointsMap_});

  void setPoints(double left, double right) {
    pointsMap['Left'] = left;
    pointsMap['Right'] = right;
  }

  Map<String, double> get pointsMap {
    return pointsMap_ ?? {'left': 0, 'right': 1};
  }
}
