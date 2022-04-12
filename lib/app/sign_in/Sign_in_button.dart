import 'package:flutter/material.dart';
import 'package:test2/common_widgets/custom_raised_button.dart';

class SignInButton extends CustomRaisedButton{
  SignInButton({
    required String text,
    Color? color,
    required Color textColor,
    required VoidCallback onPressed,

}) : assert(text != null),
  super(
  child: Text(
  text,
  style : TextStyle(color: textColor, fontSize: 15.0),
  ),
  color: color,
        borderRadius: 15.0,
  onPressed: onPressed,
  );
}