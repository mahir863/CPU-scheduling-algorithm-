import 'package:flutter/material.dart';
import '../../main.dart';

double forHeight(double size) {
  return (size / 8.533333333333333) * height;
}

double forWidth(double size) {
  return (size / 3.84) * width;
}

SizedBox sizedBoxForHeight(double height) {
  return SizedBox(
    height: forHeight(height),
  );
}

SizedBox sizedBoxForWidth(double width) {
  return SizedBox(
    width: forWidth(width),
  );
}