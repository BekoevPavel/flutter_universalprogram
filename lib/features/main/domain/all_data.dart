import 'package:flutter/foundation.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';

class AllData {
  static AllData? _instance;
  AllData._();
  List<ElementEntity> elementEntities = [];

  static AllData getInstance() {
    return _instance ??= AllData._();
  }
}
