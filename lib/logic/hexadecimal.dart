import 'binary.dart';

String hexadecimalToOtherSystem(String hex, int base) {
  int decimal_of_binary = int.parse('$hex', radix: 16);
  if (base == 2)
    return decimal_of_binary.toRadixString(2);
  else if (base == 8) return decimal_of_binary.toRadixString(8);
  return decimal_of_binary.toString();
}

String hexadecimalFraction(String hex, int base) {
  String hexFraction = hex.substring(hex.indexOf('.') + 1, hex.length);
  String bin = "";
  hex = hex.substring(0, hex.indexOf('.'));
  for (var i = 0; i < hexFraction.length; i++) {
    bin +=
        int.parse(hexFraction[i], radix: 16).toRadixString(2).padLeft(4, '0');
  }
  while (bin[bin.length - 1] != '1') {
    bin = bin.substring(0, bin.length - 1);
  }
  return binaryFraction(hexadecimalToOtherSystem(hex, 2) + '.' + bin, base);
}
