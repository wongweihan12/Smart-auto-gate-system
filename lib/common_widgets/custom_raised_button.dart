

import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
 CustomRaisedButton({
   required this.child,
   this.color,
   this.borderRadius = 2.0,
   this.height = 50.0,
   required this.onPressed,
}) : assert(borderRadius != null);
 final Widget child;
 final Color? color;
 final double borderRadius;
 final double height;
 final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(

        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color,),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    //side: BorderSide(color: color),
                ),
            ),
        ),

        child: child,
        onPressed: onPressed,

      ),
    );
  }
}
