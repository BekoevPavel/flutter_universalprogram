import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:math_expressions/math_expressions.dart';

import '../sourse/reserved_variables_sourse.dart';

class UserFunctionEntity extends ReservedVariable {
  //String? _name;
  //String? _function;
  //late ReservedVariable reservedVariable =
  //  ReservedVariable(name: _name ?? '', function: _name ?? '');

  addToListVariables() {
    var variables = AllData.getInstance().reservedVariables;
    var finded = variables.where((element) => element.name == name!);

    if (name != null && function != null) {
      if (finded.isEmpty) {
        if (name != null && function != null) {
          variables.add(this);
          //print('add Variable ${reservedVariable.name}');
        }
      } else {
        // finded.first.function = function!;

      }
    }
  }
}
