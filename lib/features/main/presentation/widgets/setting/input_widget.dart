import 'package:flutter/material.dart';

class InputElementWidget extends StatelessWidget {
  const InputElementWidget({Key? key}) : super(key: key);

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
