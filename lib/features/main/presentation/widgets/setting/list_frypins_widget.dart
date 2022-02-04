import 'package:flutter/material.dart';

class ListFryPinsWidget extends StatelessWidget {
  ListFryPinsWidget({Key? key}) : super(key: key);

  var fryPins = ['Список свободных пинов: ', 'pin2', 'pin3', 'pin4', 'pin5'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: fryPins[0],
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        //mainBloc.add(ChangeTypeEnterEvent(newValue: newValue!));
      },
      items: fryPins.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
