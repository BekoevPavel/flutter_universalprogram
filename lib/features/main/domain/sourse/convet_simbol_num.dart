String symbols = 'abcdefghijklmnopqrstuvwxyz';
String convertNumToSymbol(String str) {
  var lastNum = int.parse(str.split('').last);
  var massSymbols = symbols.split('');

  return str.substring(0, str.length - 1) + massSymbols[lastNum];
}
