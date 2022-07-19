
import 'package:flutter/material.dart';

class ThemeColor{

  static LinearGradient linearGradientBG = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.pink.shade700,
      Colors.purple.shade800,
    ],
  );
  static LinearGradient linearGradientB = LinearGradient(
      stops: [0,0.3],
      begin: Alignment(-1.2,0),
      end: Alignment.bottomRight,
      colors: [
        Colors.pink.shade300,
        Colors.purple.shade800,
      ]
  );
  static LinearGradient linearGradientBG2 = LinearGradient(
    begin: Alignment(0,-5),
    end: Alignment.bottomRight,
    colors: [
      Colors.indigo.shade200,
      Color(0xff07073b),
    ],
  );
  static LinearGradient linearGradientB2 = LinearGradient(
      stops: [0,0.3],
      begin: Alignment(-1.2,0),
      end: Alignment.bottomRight,
      colors: [
        Colors.tealAccent,
        Color(0xff07073b),
      ]
  );
}