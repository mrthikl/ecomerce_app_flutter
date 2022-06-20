import 'package:flutter/material.dart';

class MyColor {
  static var kPrimaryColor = HexColor("6F35A5");
  static var kPrimaryLightColor = HexColor("F1E6FF");
  //main text color

}

// Parse hex to color.
class HexColor extends Color {
  static int _getColorFromHex(hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(value) : super(_getColorFromHex('#$value'));
}
