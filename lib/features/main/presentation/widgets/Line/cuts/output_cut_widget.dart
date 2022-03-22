import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';

class OutputCutWidget extends StatelessWidget {
  Cut cut;
  OutputCutWidget({Key? key, required this.cut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _funcController = TextEditingController();
    _funcController.text = '0';
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
        ],
      ),
    );
  }
}
