import 'package:flutter/material.dart';
import 'package:test2/common_widgets/custom_raised_button.dart';

class Instruction2_button extends CustomRaisedButton{
  Instruction2_button({
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
              "You can control the door manually by pressing the door icon button.",
              textAlign: TextAlign.center,
              style : TextStyle(color: textColor, fontSize: 15.0,),
            ),
            Text(
              "All the activities will be recorded for tracking purpose.",
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