import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/presentation/bloc/main_bloc.dart';

class ChangeEnterTypeWidget extends StatelessWidget {
  MainBloc mainBloc;
  String dropdownValue;
  TypeEnter typeEnter;

  ChangeEnterTypeWidget(
      {Key? key,
      required this.mainBloc,
      required this.dropdownValue,
      required this.typeEnter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        if (newValue == 'OutPut Element')
          typeEnter = TypeEnter.output;
        else
          typeEnter = TypeEnter.input;
        mainBloc.add(
            ChangeTypeEnterEvent(newValue: newValue!, typeEnter: typeEnter));
      },
      items: <String>['OutPut Element', 'Input Element']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
