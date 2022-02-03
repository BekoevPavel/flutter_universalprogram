import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';
import 'dart:math' as math;

class FunctionWidget extends StatelessWidget {
  Cut cut;
  double delta;
  FunctionWidget({Key? key, required this.cut, required this.delta})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: cut.pointsMap[PositionCut.left]! - delta,
      child: Opacity(
        opacity: 0.8,
        child: Container(
          padding: const EdgeInsets.all(8),
          width: cut.pointsMap[PositionCut.width],
          height: 100,
          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(0.3),
          child: Center(
            child: Container(
              width: 150,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                  ),
                  labelText: 'Функция *',
                  hintText: 'Введите функцию',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
