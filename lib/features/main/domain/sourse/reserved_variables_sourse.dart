import 'package:math_expressions/math_expressions.dart';

import '../all_data.dart';

class ReservedVariable {
  String? name;
  String? function;
  late double _value;

  set value1(double t) {
    _value = 0.0;
  }

  double get value1 {
    if (double.tryParse(function!) == null) {
      ContextModel cm = ContextModel();
      var variablesLst = [...AllData.getInstance().reservedVariables];

      variablesLst.remove(this);
      // print('var: $name');

      for (var i in variablesLst) {
        //print('name: ${i.name}');
      }
      cm.bindVariable(
          Variable('t'), Number(AllData.getInstance().currentTime.value));

      for (var i in variablesLst) {
        if (function!.contains(i.name!)) {
          // print('iz name: ${i.name}');
          Variable varibleTmp = Variable(i.name!);
          cm.bindVariable(varibleTmp, Number(i.value1));
        }
      }

      Parser p = Parser();

      Expression exp = p.parse(function!);

      return exp.evaluate(EvaluationType.REAL, cm);
    }

    return double.parse(function!);
  }

  ReservedVariable({this.name, this.function});
}
