import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';

class AllData {
  double scaleTimeLine = 1;
  double scrollK = 1;

  static AllData? _instance;
  AllData._();
  List<ElementEntity> _elementEntities = [];

  void addEntity(ElementEntity elementEntity) {
    int oldID = _elementEntities.length;

    _elementEntities.add(elementEntity);
  }

  List<ElementEntity> get elementEntities {
    return _elementEntities;
  }

  static AllData getInstance() {
    return _instance ??= AllData._();
  }

  List<double> getScalePoints() {
    if (scaleTimeLine == 1) {}
    return [12, 21];
  }
}
