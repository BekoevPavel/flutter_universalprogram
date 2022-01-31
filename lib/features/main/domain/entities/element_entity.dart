import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';

class ElementEntity {
  LineEntity? lineEntity;
  int id = 0;
  String? nameElement;
  String? function;
  List<String>? functionsForPins;
  ElementEntity({
    required this.nameElement,
    required int? lastId,
    String? func,
    List<String>? funcForPins,
  }) {
    //
    if (func != null) {
      function = func;
    }
    if (funcForPins != null) {
      functionsForPins = funcForPins;
    }
    id = lastId! + 1;
    //
  }
}
