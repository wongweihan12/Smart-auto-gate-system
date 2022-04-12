import 'package:flutter/material.dart';
import 'package:test2/common_widgets/custom_raised_button.dart';

class Instruction_button extends CustomRaisedButton{
  Instruction_button({
    String? text,
    Color? color,
    required Color textColor,
    required VoidCallback onPressed,

  }) : assert(textColor != null),
        super(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   "Instructions",
            //   textAlign: TextAlign.center,
            //   style : TextStyle(color: textColor, fontSize: 20.0,),
            // ),
            Text(
              "Sign in your own account",
              textAlign: TextAlign.center,
              style : TextStyle(color: textColor, fontSize: 15.0,),
            ),
            Text(
              "You can signup an account if you dont have any.",
              textAlign: TextAlign.center,
              style : TextStyle(color: textColor, fontSize: 15.0,),
            ),
          ],
        ),
        color: color,
        height: 100.0,
        borderRadius: 15.0,
        onPressed: onPressed,
      );
}