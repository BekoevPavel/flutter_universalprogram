import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/sourse/convet_simbol_num.dart';
import 'package:get/get.dart';

import '../../../../domain/all_data.dart';

class OutputCutWidget extends StatelessWidget {
  Cut cut;
  ElementEntity elementEntity;

  OutputCutWidget({Key? key, required this.cut, required this.elementEntity})
      : super(key: key);
  late TextEditingController _funcController =
      TextEditingController(text: correctStrToNum(cut.function));
  late FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Start: ${cut.start.toStringAsFixed(1)}'),
              Text('End: ')
            ],
          ),
          const Text(
            'y = f(t) =',
            style: TextStyle(fontSize: 20),
          ),
          Container(
            width: 100,
            child: TextFormField(
              focusNode: myFocusNode,
              onEditingComplete: () {
                // cut.function = _funcController.text;
                cut.function = correctString(_funcController.text);
                //print(correctString(_funcController.text));
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
          // Padding(
          //   padding: const EdgeInsets.only(left: 5.0),
          //   child:
          //       // Obx(
          //       //() =>
          //       Text(
          //     'real\ntime:\n ${cut.realVelue.toStringAsFixed(1)}',
          //     style: const TextStyle(color: Colors.red),
          //   ),
          // ),
          // )
        ],
      ),
    );
  }
}
