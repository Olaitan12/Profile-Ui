import 'package:flutter/material.dart';

const mainBgColor = Color(0xFFf2f2f2f2);
const darkColor = Color(0xff1b262c);
const midColor = Color(0xff0f4c75);
const lightColor = Color(0xff3282b8);
const darkRedColor = Color(0xffbbe1fa);
const lightRedColor = Color(0xfffd685a);

const blueGradient = LinearGradient(
  colors: <Color>[darkColor, midColor, lightColor],
  stops: [0.0, 0.5, 1.0],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const redGradient = LinearGradient(
  colors: <Color>[darkRedColor, lightRedColor],
  stops: [0.0, 1.0],
  begin: Alignment.centerLeft,
  end: Alignment.centerLeft,
);

const USER_IMAGE = 
  "https://cdn.pixabay.com/photo/2013/10/16/22/42/head-196541_960_720.jpg";