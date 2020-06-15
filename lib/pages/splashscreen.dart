import 'dart:async';

import 'package:appwrite_example/Session/session_manager.dart';
import 'package:appwrite_example/pages/home.dart';
import 'package:appwrite_example/pages/mainpage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/onepiece.png"),
                fit: BoxFit.cover),
          ),
        ),
      )
    );
  }

  void startTimer() {
    Timer(Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  void navigateUser() async{
    var email = SessionManager.getEmail("USEERNAME");
    print("email------------------");
    print(email);
    if(email == null){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => MainPage()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => Home()));
    }
  }
}