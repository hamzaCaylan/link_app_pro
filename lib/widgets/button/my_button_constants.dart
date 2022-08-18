import 'package:flutter/material.dart';

class ColorsMyButton {
  static const Color crystalBell = Color.fromRGBO(239, 239, 239, 1);
  static const Color deepWater = Color.fromRGBO(34, 103, 147, 1);
  static const Color opicswallowBlue = Color.fromARGB(162, 21, 67, 103);
}

class MyTextStyle {
  static TextStyle textStyle =
      const TextStyle(fontSize: 15, color: ColorsMyButton.crystalBell);
}

class MyButtonDeco {
  static BoxDecoration myButtonDeco = const BoxDecoration(
      color: ColorsMyButton.opicswallowBlue,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          bottomLeft: Radius.circular(60.0),
          bottomRight: Radius.circular(15.0),
          topRight: Radius.circular(60.0)));
}

class IconMyButton {
  static const Icon rest = Icon(Icons.restart_alt);
}
