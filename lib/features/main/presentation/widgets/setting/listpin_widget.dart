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

  Widget _pinFuncWidget(TypePin typePin, int number) {
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
              'f(${typePin == TypePin.digital ? 'd' : 'a'}P$number)=',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 200,
            child: TextFormField(
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
        itemCount: AllData.getInstance().pins.length,
        itemBuilder: (BuildContext context, index) {
          return _pinFuncWidget(AllData.getInstance().pins[index].typePin,
              AllData.getInstance().pins[index].number);
        });
  }
}
