import 'package:flutter/material.dart';

class CustomGradient {
  static const blueGrad = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0x00006bff), Color(0x40006bff)]);
  static const cardGrad = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color.fromRGBO(37, 53, 77, 1),
      Color.fromRGBO(8, 16, 28, 1),
    ],
  );
  static const dividerGrad = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Color(0x000066ff), Color(0xff0066ff), Color(0x000066ff)]);
}
