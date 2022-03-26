import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/user_function_entity.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

import 'sourse/reserved_variables_sourse.dart';

class AllData {
  double scaleTimeLine = 1;
  double scrollK = 1;

  var posAnimate = 300.0.obs;
  var currentTime = 0.0.obs;

  late double minPosAnimation;
  List<ReservedVariable> reservedVariables = [
    ReservedVariable(name: 'dPa', function: '1'),
    ReservedVariable(name: 'dPb', function: '0'),
    // ReservedVariable(name: 'k', function: 'dPa - dPb'),
    //ReservedVariable(name: 'u', function: 'k + 100'),
    //ReservedVariable(name: 's', function: 'u + k'),
    //ReservedVariable(name: 'd', function: 'k + 100'),
  ];

  //List<Pin> pins = [];

  static AllData? _instance;
  AllData._();
  List<ElementEntity> elementEntities = [];
  List<ReservedVariable> userFunctionsReserved = [];
  RxList<UserFunctionEntity> usersFunctionsEntities =
      [UserFunctionEntity()].obs;

  static AllData getInstance() {
    return _instance ??= AllData._();
  }

  List<double> getScalePoints() {
    if (scaleTimeLine == 1) {}
    return [12, 21];
  }
}
