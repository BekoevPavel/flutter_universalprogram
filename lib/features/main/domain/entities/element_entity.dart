import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/sourse/reserved_variables_sourse.dart';
import 'package:get/get.dart';

import '../all_data.dart';
import 'pin_entity.dart';

enum TypeEnter { input, output }

class ElementEntity {
  int id = 0;
  late LineEntity lineEntity;
  String nameElement;
  List<Pin> pins = [];
  RxDouble _realValue = 0.0.obs;
  late ReservedVariable reservedVariable;

  TypeEnter? typeEnter;

  String? inputVariable;
  String? inputFunction;

  RxDouble get realValue {
    var variablesLst = AllData.getInstance().reservedVariables;

    var find = variablesLst.where((element) => element.name == inputVariable);
    for (var i in variablesLst) {
      print('name: ${i.name} val: ${i.value1}');
    }
    if (find.isNotEmpty) {
      //print('realTime: ${find.first.value1}');
      _realValue = RxDouble(find.first.value1);
    }
    //_realValue = RxDouble(varible.value1);
    // where((element) => element.name == 'myName').isNotEmpty

    return _realValue;
  }

  ElementEntity({
    required this.nameElement,
    required this.id,
    this.typeEnter,
    this.inputFunction,
  }) {
    reservedVariable = ReservedVariable();
    lineEntity = LineEntity();
  }
}
