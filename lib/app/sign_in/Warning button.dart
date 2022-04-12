

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

WarningButton({
  required BuildContext context,
  required String button,
  required String title,
  required String message,
  required String button1,
})  async {

  bool result;

    Widget okButton = TextButton(
      child : Text(button),
      onPressed: (){
        result = true;
        Navigator.pop(context, true);

      },
    );


  Widget cancelButton = TextButton(
    child : Text(button1),
    onPressed: (){
      result = false;
      Navigator.pop(context,false);

    },
  );

  AlertDialog alert = AlertDialog(
    title : Text(title),
    content: Text (message),
    actions: [
      okButton,
      cancelButton
    ],

  );

    await showDialog(
      context: context,
      builder: (BuildContext context){
        return alert;
      },
    );


}