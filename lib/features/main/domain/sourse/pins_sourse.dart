import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/tcp_controller.dart';

import '../entities/pin_entity.dart';
import 'convet_simbol_num.dart';

void removePinInVariblesList(List<String> listStr, Pin pin) {
  for (int i = 0; i < listStr.length; i++) {
    String type = pin.typePin == TypePin.digital ? 'digitalPin' : 'analogPin';
    String number = pin.number.toString();
    listStr.remove(type + number);
    print('pin ${type + number}');
  }
}

class PortA {
  ///INPut
  int? value;
  List<int>? valueDigital;
  List<Pin> pins = [
    Pin(number: 29, typePin: TypePin.digital)..name = 'dP29',
    Pin(number: 28, typePin: TypePin.digital)..name = 'dP28',
    Pin(number: 27, typePin: TypePin.digital)..name = 'dP27',
    Pin(number: 26, typePin: TypePin.digital)..name = 'dP26',
    Pin(number: 25, typePin: TypePin.digital)..name = 'dP25',
    Pin(number: 24, typePin: TypePin.digital)..name = 'dP24',
    Pin(number: 23, typePin: TypePin.digital)..name = 'dP23',
    Pin(number: 22, typePin: TypePin.digital)..name = 'dP22',
  ];

  PortA({this.value});
  void setState(int value) {
    valueDigital = convertToDigital(value);

    for (int i = 0; i < 8; i++) {
      pins[i].value = valueDigital![i];
    }

    // ignore: invalid_use_of_protected_member
    var variales = AllData.getInstance().reservedVariables.value;
    for (var item in pins) {
      variales.where((element) => element.name == item.name).first.function =
          item.value.toString();
    }
    var mass = AllData.getInstance().reservedVariables;

    for (var item in mass) {
      // print('name: ${item.name}  func: ${item.value1}');
    }
  }

  int getState(Pin pin) {
    valueDigital ??= [0, 0, 0, 0, 0, 0, 0, 0];

    for (int i = 0; i < 8; i++) {
      if (pins[i].name == pin.name) {
        valueDigital![i] = pin.value;
      }
    }
    return 0;
  }
}

class PortC {
  List<Pin> pins = [
    Pin(number: 37, typePin: TypePin.digital)..name = 'dP37',
    Pin(number: 36, typePin: TypePin.digital)..name = 'dP36',
    Pin(number: 36, typePin: TypePin.digital)..name = 'dP35',
    Pin(number: 34, typePin: TypePin.digital)..name = 'dP34',
    Pin(number: 33, typePin: TypePin.digital)..name = 'dP33',
    Pin(number: 32, typePin: TypePin.digital)..name = 'dP32',
    Pin(number: 31, typePin: TypePin.digital)..name = 'dP31',
    Pin(number: 30, typePin: TypePin.digital)..name = 'dP30',
  ];

  setPins(List<Pin> pins) {
    List<int> tt = [1, 0, 0, 0, 1, 1, 1, 1];
    var revesTT = [...tt.reversed.toList()];

    int t = 0;

    for (int i = 7; i >= 0; i--) {
      t += revesTT[i] * raiseToDegree(2, i);
    }

    for (var i in AllData.getInstance().reservedVariables) {
      // print('name: ${i.name} func: ${i.value1}');
    }
  }
}
