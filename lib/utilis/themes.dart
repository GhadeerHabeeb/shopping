import 'package:flutter/material.dart';

const mainColor=Colors.green;
const darkColor=Colors.black;


class ThemeApp{

  static final light=ThemeData(
    primaryColor: mainColor,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
  );
  static final dark=ThemeData(
    primaryColor: darkColor,
    backgroundColor: darkColor,
    brightness: Brightness.dark,
  );


}