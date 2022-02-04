import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/presentation/bloc/main_bloc.dart';

class ChangeEnterTypeWidget extends StatelessWidget {
  MainBloc mainBloc;
  String dropdownValue;
  ChangeEnterTypeWidget(
      {Key? key, required this.mainBloc, required this.dropdownValue})
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
        mainBloc.add(ChangeTypeEnterEvent(newValue: newValue!));
      },
      items: <String>['Input Element', 'OutPut Element']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
