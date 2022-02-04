import 'package:flutter/material.dart';

List<Widget> dialWidget(
    {required double delta,
    required double start,
    required double width,
    required int countLines,
    required List<Widget> widgets}) {
  for (int i = 0; i < countLines; i++) {
    var textWidget = Positioned(
      left: i * delta - start,
      bottom: 10,
      child: Text('${i * 5}'),
    );
    if (i * delta - start > 0 && i * delta - start < width) {
      widgets.add(textWidget);
    }
  }

  return widgets;
}
