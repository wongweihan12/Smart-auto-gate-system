import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:test2/app/sign_in/History.dart';
import 'package:test2/app/sign_in/Instruction.dart';
import 'package:test2/app/sign_in/login.dart';

import 'package:test2/common_widgets/Gradient_icon.dart';

import '../../main.dart';
import 'Disable Transmitter.dart';
import 'GetDateTime.dart';
import 'Menu.dart';
import 'Sign_in_button.dart';
import 'Warning button.dart';



class MainPage extends StatefulWidget {

  String thisUser;
  MainPage({Key? key, required this.thisUser}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState(thisUser);
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{
  String _displayText = 'Results go here';
  String _obstaclesStatus = 'Results go here';
  String _CarData = 'Results go here';
  final _database = FirebaseDatabase.instance.reference();
  late StreamSubscription _appdata;
  late StreamSubscription _obstaclesdata;

  late AnimationController animationController;
  late Animation degOneTranslationAnimation,degTwoTranslationAnimation,degThreeTranslationAnimation;
  late Animation rotationAnimation;


  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }



  @override

  String doorStatus = "Stop Closing";
  Color obstaclesStatus = Colors.red;
  Color doorStatusColor = Colors.red;
  bool isStoppedOpening = false;
  bool isStoppedClosing = false;
  String username = "";

  _MainPageState(String this.username);

  @override
  void initState(){
    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double >(begin: 0.0,end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.2,end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double >(begin: 0.0,end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.4,end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double >(begin: 0.0,end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.75,end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0,end: 0.0).animate(CurvedAnimation(parent: animationController
        , curve: Curves.easeOut));
    super.initState();
    animationController.addListener((){
      setState(() {

      });
    });
    _activeListeners();
    _activeListeners1();
    _activeListeners2();
    //obstaclesStatus = Colors.red;

   // Timer.periodic(Duration(seconds: 5), (timer) {
   //    if(obstaclesStatus == Colors.green){
   //     setState(() {
   //       obstaclesStatus = Colors.red;
   //     });
   //   }
   //   else{
   //     setState(() {
   //       obstaclesStatus = Colors.green;
   //     });
   //   }
   // });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  Future<void> _activeListeners()  async {
    _appdata =
    // await _database.child('Door1').get().then((value){
    //   final String result = value.value.toString();
    //   setState(() {
    //     _displayText = result;
    //   });
    // });
    _database.child('Door1').onValue.listen((event) {
   final String Door1Data = event.snapshot.value.toString();
   setState(() {
        _displayText = Door1Data;
      });
    });
  }
  Future<void> _activeListeners2()  async {
    _appdata =

    _database.child('Car').onValue.listen((event) {
      final String CarData = event.snapshot.value.toString();
      setState(() {
        _CarData = CarData;
      });
    });
  }
  Future<void> _activeListeners1() async {
    _obstaclesdata =

        _database
            .child('Motion')
            .onValue
            .listen((event) {
          final String obstacledata = event.snapshot.value.toString();
          setState(() {
            _obstaclesStatus = obstacledata;
          });
        });
  }

  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    // DatabaseReference _testRef = FirebaseDatabase.instance.reference().child("test");
    // _testRef.set(doorStatus);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Main Page'),
      //   elevation: 2.0,
      //   backgroundColor: Colors.blue,
      // ),
      body: Container(
            padding: EdgeInsets.all(20.0),
            constraints: BoxConstraints.expand(
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/images9.gif"),
                fit : BoxFit.cover
              ),
            ),
            child : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [


                Material(
                  elevation: 20,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.lightBlueAccent,
                          Colors.greenAccent,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Manual :',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              doorStatus,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                              color: doorStatusColor,
                            ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                                'Door :',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                )
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                                _displayText,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: doorStatusColor,
                                )
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                                'Obstacle :',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                )
                            ),


                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              _obstaclesStatus,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: doorStatusColor,
                                ),
                            ),
                            // Container(
                            //   color: obstaclesStatus,
                            //   height: 20.0,
                            //   width: 20.0,
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                                'Car :',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                )
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                                _CarData,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: doorStatusColor,
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                SizedBox(
                  height: 20.0,
                ),


                SizedBox(
                  height: 10.0,
                ),
                RawMaterialButton(
                  onPressed: () async {
                  // if(obstaclesStatus == Colors.green){
                      if(doorStatus == "Open"){
                        setState(() {
                          doorStatus = "Stop Opening";
                          doorStatusColor = Colors.deepOrangeAccent;
                        });
                        //await Future<void>.delayed(Duration(seconds: 3));
                      //   if(isStoppedClosing){
                      //     doorStatus = "Stop";
                      //     doorStatusColor = Colors.red;
                      //   }
                      //   else {
                      //     setState(() {
                      //       doorStatus = "Closed";
                      //       doorStatusColor = Colors.red;
                      //     });
                      //   }
                       }
                      else if(doorStatus == "Stop Opening"){
                        setState(() {
                          doorStatus = "Close";
                          doorStatusColor = Colors.deepOrangeAccent;
                        });
                        //await Future<void>.delayed(Duration(seconds: 3));
                        // if(isStoppedOpening){
                        //   setState(() {
                        //     doorStatus = "Stop Opening";
                        //     doorStatusColor = Colors.red;
                        //   });
                        // }
                        // else {
                        //   setState(() {
                        //     doorStatus = "Opened";
                        //     doorStatusColor = Colors.green;
                        //   });
                        // }
                      }

                      else if(doorStatus == "Close") {
                        setState(() {
                          //isStoppedOpening = false;
                          doorStatus = "Stop Closing";
                          doorStatusColor = Colors.deepOrangeAccent;
                        });
                        //await Future<void>.delayed(Duration(seconds: 3));
                        // if (isStoppedClosing) {
                        //   doorStatus = "Stop Closing";
                        //   doorStatusColor = Colors.red;
                        // }
                        // else {
                        //   setState(() {
                        //     doorStatus = "Closed";
                        //     doorStatusColor = Colors.red;
                        //   });
                        // }
                      }

                      else if(doorStatus == "Stop Closing") {
                        setState(() {
                          //isStoppedClosing = false;
                          doorStatus = "Open";
                          doorStatusColor = Colors.deepOrangeAccent;
                        });
                        // await Future<void>.delayed(Duration(seconds: 3));
                        // if (isStoppedOpening) {
                        //   doorStatus = "Stop Opening";
                        //   doorStatusColor = Colors.red;
                        // }
                        // else {
                        //   setState(() {
                        //     doorStatus = "Opened";
                        //     doorStatusColor = Colors.green;
                        //   });
                        // }
                      }

                      // else if(doorStatus == "Closing"){
                      //   setState(() {
                      //     isStoppedClosing = true;
                      //     doorStatus = "Stop Closing";
                      //     doorStatusColor = Colors.red;
                      //   });
                      // }
                      //
                      // else if(doorStatus == "Opening"){
                      //   setState(() {
                      //     isStoppedOpening = true;
                      //     doorStatus = "Stop Opening";
                      //     doorStatusColor = Colors.red;
                      //   });
                      // }

                      else{
                      }
                   // }
                   //
                   // else{
                   //   if(doorStatus == "Opened"){
                   //
                   //
                   //     var result = await WarningButton(
                   //       button : 'Yes',
                   //       button1 : 'No',
                   //       message : 'There is an obstacle detected, are u sure u want to continue the process?',
                   //       context : context,
                   //       title : 'Warning',
                   //     );
                   //
                   //     print(result);
                   //
                   //     if (result == true){
                   //       setState(() {
                   //         doorStatus = "Closing";
                   //         doorStatusColor = Colors.deepOrangeAccent;
                   //       });
                   //     }
                   //     else{
                   //
                   //     }
                   //   }
                   // }


                   try{
                     await _database
                         .update({'Manual' : doorStatus , });
                   } catch (e){
                     print('You got an error!');
                   }

                   final String date = getDate();
                   final String time = getTime();

                   await _database.child("record").push().set({
                      'action': doorStatus,
                      'User' : username,
                      'date' :date,
                      'time' :time,

                    });



                  },
                  elevation: 2.0,
                  fillColor: Colors.grey[200],
                  padding: EdgeInsets.all(40.0),
                  shape: CircleBorder(),


                  child:
                  // Text(
                  //   'hello',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       fontSize: 80,
                  //       fontWeight: FontWeight.w600,
                  //     )
                  // )
                  GradientIcon(
                    Icons.sensor_door_outlined,
                    12D0.0,
                    LinearGradient(
                      colors: <Color>[
                        Colors.red,
                        Colors.yellow,
                        Colors.blue,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),



                ),
                ),
                // SizedBox(
                //   height: 50.0,
                // ),

                // SignInButton(
                //   text: 'History',
                //   textColor: Colors.deepOrange,
                //   color: Colors.yellow.shade100,
                //   onPressed: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(builder: (context) => History()),
                //     );
                //     // if(obstaclesStatus == Colors.green){
                //     //   setState(() {
                //     //     obstaclesStatus = Colors.red;
                //     //   });
                //     // }
                //     // else{
                //     //   setState(() {
                //     //     obstaclesStatus = Colors.green;
                //     //   });
                //     // }
                //   },
                // ),
                // SizedBox(
                //   height: 10.0,
                // ),
                // SignInButton(
                //   text: 'Car Disable',
                //   textColor: Colors.deepOrange,
                //   color: Colors.yellow.shade100,
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => MyApp2()),
                //     );
                //
                //   },
                // ),
                Positioned(
                    right: 30,
                    bottom: 30,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: <Widget>[
                        IgnorePointer(
                          child: Container(
                            color: Colors.transparent,
                            height: 150.0,
                            width: 150.0,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset.fromDirection(getRadiansFromDegree(270),degOneTranslationAnimation.value * 100),
                          child: Transform(
                            transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degOneTranslationAnimation.value),
                            alignment: Alignment.center,
                            child: CircularButton(
                              color: Colors.blue,
                              width: 50,
                              height: 50,
                              icon: Icon(
                                Icons.history,
                                color: Colors.white,
                              ),
                              onClick: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => History()),
                                );
                              },
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset.fromDirection(getRadiansFromDegree(225),degTwoTranslationAnimation.value * 100),
                          child: Transform(
                            transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degTwoTranslationAnimation.value),
                            alignment: Alignment.center,
                            child: CircularButton(
                              color: Colors.orangeAccent,
                              width: 50,
                              height: 50,
                              icon: Icon(
                                Icons.info_outline,
                                color: Colors.white,

                              ),

                              onClick: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Instruction()),
                                );
                              },
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset.fromDirection(getRadiansFromDegree(180),degThreeTranslationAnimation.value * 100),
                          child: Transform(
                            transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degThreeTranslationAnimation.value),
                            alignment: Alignment.center,
                            child: CircularButton(
                              color: Colors.redAccent,
                              width: 50,
                              height: 50,
                              icon: Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                              onClick: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Login()),
                                );
                              },
                            ),
                          ),
                        ),
                        Transform(
                          transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value)),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.greenAccent,
                            width: 60,
                            height: 60,
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            onClick: (){
                              if (animationController.isCompleted) {
                                animationController.reverse();
                              } else {
                                animationController.forward();
                              }
                            },
                          ),
                        )

                      ],
                    ))




                // SignInButton(
                //   text: 'Alert',
                //   textColor: Colors.white,
                //   color: Colors.lightBlue,
                //   onPressed: () {
                //
                //     bool result = WarningButton(
                //       button : 'Yes',
                //       button1 : 'No',
                //       message : 'There is an obstacle detected, are u sure u want to continue the process?',
                //       context : context,
                //       title : 'Warning',
                //     );
                //
                //     if (result == true){
                //       setState(() {
                //         doorStatus = "Closing";
                //         doorStatusColor = Colors.deepOrangeAccent;
                //       });
                //     }
                //     else{
                //
                //     }
                //   },
                // ),

              ],
            ),



          //);

      ),
      backgroundColor: Colors.grey[200],
    );
  }

  @override
  void deactivate(){
    _appdata.cancel();
    super.deactivate();
  }

}

class CircularButton extends StatelessWidget {

  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final VoidCallback onClick;

  CircularButton({required this.color, required this.width, required this.height, required this.icon, required this.onClick()});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color,shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(icon: icon,enableFeedback: true, onPressed: onClick),
    );
  }
}