import 'dart:async';
import 'package:ejcsev/screens/global_app.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3),() {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const GlobalApp(),), (route) => false);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/splash_screen.jpg"),
        fit: BoxFit.cover,
      )),
      child: Stack(
        children: [
          Positioned(
            bottom: 100,
            left: 50,
            right: 50,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                backgroundColor: Colors.blueGrey[200],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
