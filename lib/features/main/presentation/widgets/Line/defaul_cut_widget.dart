import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';
import 'dart:math' as math;

import 'package:flutter_universalprogram/features/main/presentation/widgets/Line/output_cut_widget.dart';

import 'input_cut_widget.dart';

class DefaultCutWidget extends StatelessWidget {
  Cut cut;
  double delta;
  DefaultCutWidget({Key? key, required this.cut, required this.delta})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (cut.pointsMap[PositionCut.left]!) *
              AllData.getInstance().scaleTimeLine -
          delta,
      child: Opacity(
        opacity: 0.8,
        child: Container(
          padding: const EdgeInsets.all(8),
          width: (cut.pointsMap[PositionCut.width]!) *
              AllData.getInstance().scaleTimeLine,
          height: 100,
          color: cut.color,
          child: OutputCutWidget(
            cut: cut,
          ),
        ),
      ),
    );
  }
}
