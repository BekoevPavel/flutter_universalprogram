import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/pin_entity.dart';

class AllData {
  double scaleTimeLine = 1;
  double scrollK = 1;

  //List<Pin> pins = [];

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
