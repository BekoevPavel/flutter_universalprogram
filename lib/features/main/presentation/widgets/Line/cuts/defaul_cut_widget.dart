import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';

import 'package:flutter_universalprogram/features/main/presentation/widgets/Line/cuts/output_cut_widget.dart';

import 'input_cut_widget.dart';

class DefaultCutWidget extends StatelessWidget {
  ElementEntity elementEntity;
  Cut cut;
  double delta;
  DefaultCutWidget(
      {Key? key,
      required this.cut,
      required this.delta,
      required this.elementEntity})
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
          child: elementEntity.typeEnter == TypeEnter.input
              ? InputCutWidget(
                  cut: cut,
                )
              : OutputCutWidget(
                  cut: cut,
                ),
        ),
      ),
    );
  }
}
