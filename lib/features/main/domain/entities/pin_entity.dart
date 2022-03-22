class Pin {
  TypePin typePin;
  int number;
  String? function;

  Pin({required this.typePin, required this.number});

  double getValue(double time) {
    return 0;
  }
}

enum TypePin { digital, analog }
