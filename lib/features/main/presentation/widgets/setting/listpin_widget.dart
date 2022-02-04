import 'package:flutter/material.dart';

class ListPinFuncWidget extends StatelessWidget {
  const ListPinFuncWidget({Key? key}) : super(key: key);

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
          const Text('Функции для пинов'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.grey[350],
            width: 300,
            height: 200,
            child: _listPins(),
          ),
        ],
      ),
    );
  }

  Widget _pinFuncWidget() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Функция F(t) *',
        hintText: 'Введите функцию F(t)',
        prefixIcon: Icon(
          Icons.fiber_pin_outlined,
          color: Colors.green,
        ),
      ),
    );
  }

  Widget _listPins() {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, index) {
          return _pinFuncWidget();
        });
  }
}
