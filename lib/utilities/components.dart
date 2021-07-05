import 'package:flutter/material.dart';
import 'constants.dart';

class Parameters extends StatelessWidget {
  Parameters({this.text, this.value});
  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: kParameterLabelTextStyle,
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w600,
            color: kDarkBlue,
          ),
        )
      ],
    );
  }
}
