import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';

class InputCutWidget extends StatelessWidget {
  Cut cut;
  InputCutWidget({Key? key, required this.cut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                child: const Text('K'),
              ),
            ],
          ),
          const Text('f() = dP2 * dP1'),
          const Text('real time value = '),
        ],
      ),
    );
  }
}
