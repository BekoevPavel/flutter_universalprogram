import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/pin_entity.dart';

class ListPinFuncWidget extends StatelessWidget {
  ElementEntity elementEntity;
  ListPinFuncWidget({Key? key, required this.elementEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(
          color: Colors.green,
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Функции для пинов',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              color: Colors.grey[350],
              width: 500,
              height: 200,
              child: _listPins(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pinFuncWidget(Pin pin) {
    FocusNode myFocusNodeFunction = FocusNode();
    TextEditingController _textController =
        TextEditingController(text: pin.function);
    return Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(
          color: const Color.fromARGB(200, 188, 226, 237),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              'f(${pin.typePin == TypePin.digital ? 'd' : 'a'}P${pin.number})=',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 200,
            child: TextFormField(
              controller: _textController,
              focusNode: myFocusNodeFunction,
              onEditingComplete: () {
                myFocusNodeFunction.unfocus();
                pin.function = _textController.text;
                //elementEntity.functions.add(value)
              },
              decoration: const InputDecoration(
                labelText: 'Функция F(t) *',
                hintText: 'Введите функцию F(t)',
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.highlight_remove,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listPins() {
    return ListView.builder(
        itemCount: elementEntity.pins.length,
        itemBuilder: (BuildContext context, index) {
          return _pinFuncWidget(elementEntity.pins[index]);
        });
  }
}
