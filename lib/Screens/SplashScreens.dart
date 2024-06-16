import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'Dashboard.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash_Screen(),
    );
  }
}

class Splash_Screen extends StatelessWidget {
  const Splash_Screen({Key? key}) : super(key: key);
  get splash => null;
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: LottieBuilder.asset("assets/load.json"),
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  "Streakifyy",
                  style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
      nextScreen: Dashboard(),
      splashIconSize: 400,
      backgroundColor: Colors.green,
    );
  }
}
