import 'dart:convert';

String symbols = 'abcdefghijkl';
String convertNumToSymbol(String str) {
  if (str.length != 1) {
    return "ERR_ARGUMENT";
  }

  return symbols[int.parse(str)];
}

String convertSymbolToNum(String str) {
  var preLast = str.split('')[str.length - 2];
  var lastNum = str.split('').last;
  if (str.length == 3) {
    if (!isNumber(str.split('').last)) {
      return str.substring(0, str.length - 1) +
          symbols.indexOf(lastNum).toString();
    }
  } else {
    if (!isNumber(str.split('').last)) {
      return str.substring(0, str.length - 2) +
          symbols.indexOf(preLast).toString() +
          symbols.indexOf(lastNum).toString();
    }
  }
  return str;
}

bool isNumber(String s) {
  if (int.tryParse(s) != null) {
    return true;
  }
  return false;
}

String correctString(String str) {
  if (str.length >= 3) {
    var mass = str.split('');

    for (var i = 0; i < mass.length; i++) {
      if (mass[i] == 'P') {
        if (isNumber(mass[i + 1])) {
          mass[i + 1] = convertNumToSymbol(mass[i + 1]);
        }

        if (i + 2 < mass.length && isNumber(mass[i + 2])) {
          mass[i + 2] = convertNumToSymbol(mass[i + 2]);
        }
        i += 2;
      }
    }

    var result = "";
    for (var item in mass) {
      result += item;
    }

    return result;
  }

  return str;
}

String correctStrToNum(String? str) {
  if (str != null) {
    var mass = str.split('');

    for (int i = 0; i < mass.length; i++) {
      if (mass[i] == 'P') {
        mass[i + 1] = mass[i + 1].replaceAll(
            RegExp(r'[a-z]'), symbols.indexOf(mass[i + 1]).toString());
        if (i + 2 < mass.length) {
          mass[i + 2] = mass[i + 2].replaceAll(
              RegExp(r'[a-z]'), symbols.indexOf(mass[i + 2]).toString());
        }
        i += 2;
      }
    }

    return mass.join();
  }
  return '';
}

int raiseToDegree(int num, int degree) {
  int tmp = num;
  if (degree == 0) {
    return 1;
  }
  for (int i = 0; i < degree - 1; i++) {
    num *= tmp;
  }

  return num;
}
