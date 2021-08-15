import 'package:flutter/material.dart';

class TransformFloatButton extends StatelessWidget {
  final Widget floatButton;
  final double translateValue;

  TransformFloatButton({
    required this.floatButton,
    required this.translateValue,
  }) : super(key: ObjectKey(floatButton));

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(
        0.0,
        translateValue,
        0.0,
      ),
      child: floatButton,
    );
  }
}
