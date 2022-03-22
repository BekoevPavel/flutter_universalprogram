import '../entities/pin_entity.dart';

void removePinInVariblesList(List<String> listStr, Pin pin) {
  for (int i = 0; i < listStr.length; i++) {
    String type = pin.typePin == TypePin.digital ? 'digitalPin' : 'analogPin';
    String number = pin.number.toString();
    listStr.remove(type + number);
    print('pin ${type + number}');
    //
  }
}
