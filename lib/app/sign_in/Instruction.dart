import 'package:flutter/material.dart';
import 'package:test2/app/sign_in/Instruction_column.dart';
import 'package:test2/app/sign_in/Sign_in_button.dart';
import 'package:test2/app/sign_in/main_page.dart';
import 'package:test2/app/sign_in/social_sign_in_button.dart';
import 'package:test2/common_widgets/custom_raised_button.dart';

import '../../common_widgets/Gradient_icon.dart';
import 'Instruction2_column.dart';


class Instruction extends StatelessWidget {
  const Instruction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Smart Autogate System'),
      //   elevation: 2.0,
      //   backgroundColor: Colors.lightBlueAccent,
      // ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/images10.gif"),
            fit: BoxFit.cover
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Text(
          //   'Instruction',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     fontSize: 29.0,
          //     fontWeight: FontWeight.w600,
          //     color: Colors.white,
          //   ),
          // ),

          Image.asset(
              "images/image11.png",

          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            'Instructions ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 29.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Instruction_button(

            textColor: Colors.white,
            color: Colors.pink.shade100,
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>Instruction()));
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          Instruction2_button(

            textColor: Colors.white,
            color: Colors.pink.shade100,
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>Instruction()));
            },
          ),
        ],
      ),
    );
  }

}