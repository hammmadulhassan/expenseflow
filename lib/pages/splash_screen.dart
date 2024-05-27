import 'dart:async';

import 'package:expenseflow/pages/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expenseflow/tabs.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, CupertinoPageRoute(
        builder: (context) => WelcomeScreen(),
      ));
    });
  }


  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Container(
        color : const Color(0xFFA3E78D),
        // color: Colors.green,
        child: Center(child: Text('ExpenseFlow' , style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color:Colors.white
        ),) ),
      ),
    );
  }
}