import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<Widget> dialWidget(
    {required RxDouble delta,
    required double start,
    required double width,
    required int countLines,
    required List<Widget> widgets}) {
  for (int i = 0; i < countLines; i++) {
    var textWidget = Obx(() => Positioned(
          left: i * delta.value - start,
          bottom: 10,
          child: Text('${i * 5}'),
        ));

    if (i * delta.value - start > 0 && i * delta.value - start < width) {
      widgets.add(textWidget);
    }
  }

  return widgets;
}
