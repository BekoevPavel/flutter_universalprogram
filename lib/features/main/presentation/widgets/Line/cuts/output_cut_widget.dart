import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';

class OutputCutWidget extends StatelessWidget {
  Cut cut;
  ElementEntity elementEntity;

  OutputCutWidget({Key? key, required this.cut, required this.elementEntity})
      : super(key: key);
  late TextEditingController _funcController =
      TextEditingController(text: cut.function ?? '0');
  late FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          const Text(
            'y = f(t) =',
            style: TextStyle(fontSize: 20),
          ),
          Container(
            width: 100,
            child: TextFormField(
              focusNode: myFocusNode,
              onEditingComplete: () {
                print('func: ${_funcController.text}');
                cut.function = _funcController.text;
                myFocusNode.unfocus();
              },
              controller: _funcController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.green, width: 2),
                ),
                labelText: 'Функция ${cut.id}',
                hintText: 'Введите функцию',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              'real\ntime:\n 4',
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
