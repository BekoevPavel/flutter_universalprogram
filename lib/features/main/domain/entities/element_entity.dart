import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';

import 'pin_entity.dart';

enum TypeEnter { input, output }

class ElementEntity {
  int id = 0;
  late LineEntity lineEntity;
  String nameElement;
  List<Pin> pins = [];

  TypeEnter? typeEnter;

  String? inputVariable;
  String? inputFunction;

  ElementEntity({
    required this.nameElement,
    required this.id,
    this.typeEnter,
    this.inputFunction,
  }) {
    lineEntity = LineEntity();
  }
}
