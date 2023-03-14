class Pin {
  TypePin typePin;
  int number;
  String? function;
  String? name;

  int value = 1;

  Pin({required this.typePin, required this.number});
}

enum TypePin { digital, analog }
