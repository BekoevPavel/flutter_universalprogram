import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';

class ElementEntity {
  LineEntity? lineEntity;
  int id = 0;
  String? nameElement;
  String? function;
  List<String>? functionsForPins;
  ElementEntity({
    required this.nameElement,
    required this.id,
    String? func,
    List<String>? funcForPins,
  }) {
    lineEntity = LineEntity();
    //
    if (func != null) {
      function = func;
    }
    if (funcForPins != null) {
      functionsForPins = funcForPins;
    }
    //
  }
}
