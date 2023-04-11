import 'package:flutter/material.dart';

extension DoubleWithSizedBoxExtension on num {
  SizedBox get sw => SizedBox(width: toDouble());

  SizedBox get sh => SizedBox(height: toDouble());
}
