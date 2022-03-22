import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';

class InputElementWidget extends StatelessWidget {
  ElementEntity elementEntity;
  InputElementWidget({Key? key, required this.elementEntity}) : super(key: key);
  late TextEditingController _textControllerVariable =
      TextEditingController(text: elementEntity.inputVariable ?? '');
  late TextEditingController _textControllerFunction =
      TextEditingController(text: elementEntity.inputFunction ?? '');

  late FocusNode myFocusNodeVariable = FocusNode();
  late FocusNode myFocusNodeFunction = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('функция контрольной переменной:'),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text('Переменная:'),
            Container(
              width: 100,
              child: TextFormField(
                onEditingComplete: () {
                  elementEntity.inputVariable = _textControllerVariable.text;
                  myFocusNodeVariable.unfocus();
                },
                focusNode: myFocusNodeVariable,
                controller: _textControllerVariable,
                decoration: const InputDecoration(
                  labelText: 'Перенная',
                  hintText: '...',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                '=',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              width: 200,
              child: TextFormField(
                onEditingComplete: () {
                  elementEntity.inputFunction = _textControllerFunction.text;
                  myFocusNodeFunction.unfocus();
                },
                focusNode: myFocusNodeFunction,
                controller: _textControllerFunction,
                decoration: const InputDecoration(
                  labelText: 'Функция от pins *',
                  hintText: 'Введите функцию от pins',
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
