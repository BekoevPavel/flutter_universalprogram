import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';

enum TypeEnter { input, output }

class ElementEntity {
  TypeEnter? typeEnter;

  late LineEntity lineEntity;
  int id = 0;
  String nameElement;
  String? function;
  List<String>? functionsForPins;
  ElementEntity({
    required this.nameElement,
    required this.id,
    this.typeEnter,
    this.function,
    this.functionsForPins,
  }) {
    lineEntity = LineEntity();
  }
}
