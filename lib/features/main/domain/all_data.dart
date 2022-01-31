import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';

class AllData {
  double scaleTimeLine = 1;

  static AllData? _instance;
  AllData._();
  List<ElementEntity> elementEntities = [];

  static AllData getInstance() {
    return _instance ??= AllData._();
  }

  List<double> getScalePoints() {
    if (scaleTimeLine == 1) {}
    return [12, 21];
  }
}
