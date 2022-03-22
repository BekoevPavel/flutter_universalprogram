import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/pin_entity.dart';
import 'package:get/get.dart';

class AllData {
  double scaleTimeLine = 1;
  double scrollK = 1;

  var posAnimate = 300.0.obs;
  var currentTime = 0.0.obs;

  late double minPosAnimation;

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
