import 'package:flutter/material.dart';
import 'package:test2/app/sign_in/History.dart';
import 'package:test2/app/sign_in/Instruction.dart';
import 'package:test2/app/sign_in/Login.dart';
import 'package:test2/app/sign_in/Sign_in_button.dart';

import 'package:test2/app/sign_in/main_page.dart';
import 'package:test2/app/sign_in/authentication.dart';
import 'package:test2/app/sign_in/social_sign_in_button.dart';
import 'package:test2/common_widgets/custom_raised_button.dart';

import 'fingerprint_page.dart';


class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Smart Autogate System'),
      //   elevation: 2.0,
      //   backgroundColor: Colors.lightBlueAccent,
      // ),
      body: _buildContent(context),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMember()));
      //   },
      // ),
       );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/images7.gif"),
            fit : BoxFit.cover
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
              'Autogate System ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 29.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
          ),

          SizedBox(height:50.0),

          SocialSignInButton(
            assetName: 'images/images5.png',
          text: 'Sign in as Dad',
          textColor: Colors.black87,
          color: Colors.white,
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>MainPage(thisUser: "dad")));
          },
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            assetName: 'images/images6.png',
            text: 'Sign in as Mom',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=> MainPage(thisUser: "mom")));
            },
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Others',
            textColor: Colors.white,
            color: Colors.teal,
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>MainPage(thisUser: "other")));
            },
          ),

          SizedBox(height:50.0),
          SignInButton(
            text: 'Instruction',
            textColor: Colors.black,
            color: Colors.greenAccent,
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Instruction()));
            },
          ),
          // SizedBox(height: 8.0),
          // Text(
          //   'or',
          //   style: TextStyle(fontSize: 14.0, color: Colors.black87),
          //   textAlign: TextAlign.center,
          //
          // ),
          // SizedBox(height: 8.0),
          // SignInButton(
          //   text: 'Go anonymous',
          //   textColor: Colors.black,
          //   color: Colors.lime[300],
          //   onPressed: () {},
          // ),


          


        ],
      ),
    );
  }

  void _signInWithGoogle(){

  }}
