import 'package:flutter_universalprogram/features/main/domain/sourse/convet_simbol_num.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

import '../all_data.dart';

class ReservedVariable {
  String? name;
  String? function;

  RxDouble get value1 {
    if (double.tryParse(function!) == null) {
      function = correctString(function!);

      ContextModel cm = ContextModel();
      var variablesLst = [...AllData.getInstance().reservedVariables];

      variablesLst.remove(this);

      cm.bindVariable(
          Variable('t'), Number(AllData.getInstance().currentTime.value));
      function = correctString(function!);
      for (var i in variablesLst) {
        i.name = correctString(i.name!);

        if (function!.contains(i.name!)) {
          Variable varibleTmp = Variable(i.name!);
          cm.bindVariable(varibleTmp, Number(i.value1.value));
        }
      }

      Parser p = Parser();

      Expression exp = p.parse(function!);

      return exp.evaluate(EvaluationType.REAL, cm);
    }

    return RxDouble(double.parse(function!));
  }

  ReservedVariable({this.name, this.function});
}
