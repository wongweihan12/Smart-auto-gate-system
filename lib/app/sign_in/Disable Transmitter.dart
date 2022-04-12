



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test2/app/sign_in/DisableTransmitterButton.dart';
import 'package:test2/app/sign_in/social_sign_in_button.dart';
import 'package:test2/main.dart';

import 'Sign_in_button.dart';

class DisableTransmitter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Disable'),
        elevation: 2.0,

      ),
      body: _buildContent(context),
      // backgroundColor: Colors.grey[200],

    );
  }
}
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

Widget _buildContent(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(16.0),
    constraints: BoxConstraints.expand(),


    child: Column(


      children: <Widget>[

        DisableButton(
          assetName: 'images/images30.png',
          text: "   Dad's car                       ",
          textColor: Colors.black87,
          color: Colors.white,
          onPressed: () {},
        ),
        SizedBox(height: 8.0),
        DisableButton(
          assetName: 'images/images29.png',
          text: "   Mom's car                     ",
          textColor: Colors.black87,
          color: Colors.white,
          onPressed: () {},
        ),







      ],
    ),
  );
}
