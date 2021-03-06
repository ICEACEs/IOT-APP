import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/mainscreen.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:connectivity/connectivity.dart';
import 'package:myapp/screens/introduction.dart';
import 'package:myapp/screens/noconnection.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isConnected = false;
  late StreamSubscription sub;
  @override
  void initState() {
    super.initState();
    sub = Connectivity().onConnectivityChanged.listen((result) => {
          setState(() => {isConnected = (result != ConnectivityResult.none)}),
        });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds:const OnBoardingPage(),
      image: Image.asset('images/logoTrans.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: const TextStyle(color: Colors.deepPurple),
      photoSize: 150,
      loaderColor: const Color(0xffe4213f),
    );
  }
}
