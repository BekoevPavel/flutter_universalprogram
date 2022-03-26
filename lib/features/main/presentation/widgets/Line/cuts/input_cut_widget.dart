import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';
import 'package:get/get.dart';

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
          const Text(
            'Контрольная переменная: ',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            textWidthBasis: TextWidthBasis.parent,
          ),
          Row(
            children: [
              Text(
                elementEntity.inputVariable ?? 'None',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.red[400]),
              ),
              Text(' = f(t) = ${elementEntity.inputFunction}'),
            ],
          ),
          Obx((() => Text(
              'real time value = ${elementEntity.realValue.value.toStringAsFixed(1)}')))
        ],
      ),
    );
  }
}
