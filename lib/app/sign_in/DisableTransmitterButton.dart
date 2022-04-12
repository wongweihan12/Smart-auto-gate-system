import 'package:flutter/material.dart';
import 'package:test2/app/sign_in/Disable%20Transmitter.dart';
import 'package:test2/common_widgets/custom_raised_button.dart';

class DisableButton extends CustomRaisedButton{
  DisableButton({
    required String assetName,
    required String text,
    Color? color,
    required Color textColor,
    required VoidCallback onPressed,

  }) : assert(text != null),
        super(
        child: Row(

          children: [
            Image.asset(assetName),
            Text(
              text,
              style: TextStyle(color: textColor, fontSize: 15.0),
            ),
            Opacity(
              opacity: 0.0,
              child: Image.asset(assetName),
            ),
            MyStatefulWidget()
          ],
        ),
        color: color,
        onPressed: onPressed,
        borderRadius: 15.0,
      );
}