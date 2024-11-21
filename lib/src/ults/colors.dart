import 'package:flutter/material.dart';

enum ColorPalette {
  primaryBlue,
  neutralBlack,
  blue10,
  gray00,
  gray05,
  gray10,
  gray20,
}

Map<ColorPalette, Color> colors = {
  ColorPalette.primaryBlue: const Color(0xFF0500Ff),
  ColorPalette.blue10: const Color(0xFFedeffb),
  ColorPalette.neutralBlack: const Color(0xFF1c1c1c),
  ColorPalette.gray00: const Color(0xFFf0f0f0),
  ColorPalette.gray05: const Color(0xFFf5f5f5),
  ColorPalette.gray10: const Color(0xFFdfdfdf),
  ColorPalette.gray20: const Color(0xFF9e9e9e),
};
