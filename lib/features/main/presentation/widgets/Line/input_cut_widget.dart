import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';

class InputCutWidget extends StatelessWidget {
  Cut cut;
  InputCutWidget({Key? key, required this.cut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          const Text(
            'Контрольная переменная: ',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            textWidthBasis: TextWidthBasis.parent,
          ),
          Container(
            width: 50,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.green, width: 2),
                ),
                labelText: 'Переменная ${cut.id}',
                hintText: 'Введите переменную',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
