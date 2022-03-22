import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';

class InputCutWidget extends StatelessWidget {
  Cut cut;
  ElementEntity elementEntity;
  InputCutWidget({Key? key, required this.cut, required this.elementEntity})
      : super(key: key);

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
                child: Text(
                  elementEntity.inputVariable ?? 'None',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red[400]),
                ),
              ),
            ],
          ),
          Text('f() = ${elementEntity.inputFunction}'),
          const Text('real time value = '),
        ],
      ),
    );
  }
}
