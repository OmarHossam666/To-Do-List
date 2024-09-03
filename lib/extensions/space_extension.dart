import 'package:flutter/material.dart';

extension IntExtension on int?
{
  int validate({int value = 0})
  {
    return this ?? value;
  }

  Widget get height
  {
    return SizedBox(height: this?.toDouble());
  }

  Widget get width
  {
    return SizedBox(width: this?.toDouble());
  }
}