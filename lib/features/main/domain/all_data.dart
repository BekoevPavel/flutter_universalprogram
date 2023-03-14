import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/user_function_entity.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

import 'sourse/reserved_variables_sourse.dart';

class AllData {
  double scaleTimeLine = 1;
  double scrollK = 1.0;

  var posAnimate = 300.0.obs;
  var currentTime = 0.0.obs;

  RxString tcpVal = ''.obs;

  late double minPosAnimation;
  RxList<ReservedVariable> reservedVariables = RxList([
    ReservedVariable(name: 'dP1', function: '13'),

    // //ReservedVariable(name: 'dPbe', function: '33'),
    // // ReservedVariable(name: 'k', function: 'dPa - dPb'),
    // //ReservedVariable(name: 'u', function: 'k + 100'),
    // //ReservedVariable(name: 's', function: 'u + k'),
    // //ReservedVariable(name: 'd', function: 'k + 100'),
  ]);

  generateVariable() {
    for (int i = 2; i < 55; i++) {
      reservedVariables.add(ReservedVariable(name: 'dP$i', function: '0'));
    }
  }

  //List<Pin> pins = [];

  static AllData? _instance;
  AllData._();
  RxList<ElementEntity> elementEntities = RxList.empty();
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
