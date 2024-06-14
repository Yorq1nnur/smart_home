import 'package:flutter/material.dart';

double height = 0.0;
double width = 0.0;

extension SizeUtils on int {
  double get h => (this / 932) * height;
  double get w => (this / 430) * width;

  SizedBox getH() => SizedBox(height: this.h);
  SizedBox getW() => SizedBox(width: this.w);
}