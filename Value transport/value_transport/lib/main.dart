import "package:flutter/material.dart";
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:value_transport/itinerary.dart';
import 'package:value_transport/number.dart';
import 'login/login.dart';
import 'Registration/register.dart';
import 'tarif.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      //Animation de demarrage et redirection
      home: AnimatedSplashScreen(
        splash: Image.asset("images/logo.png"),
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: MyHome(),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Itinerary(),
    );
  }
}
