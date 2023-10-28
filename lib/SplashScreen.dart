import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/ui/homeScreen/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
static const String routeName = "SplashScreen";


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3) , splashNavigator );
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
     children: [
       Image.asset("assets/images/splash.png",width: double.infinity,
       fit: BoxFit.fill,
       ),
       Scaffold()
     ],
    );
  }
  splashNavigator(){
    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName,
            (route) => false);
  }
}
