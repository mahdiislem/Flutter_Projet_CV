import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutterprofile/pages/ImagesPage.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(


      splash: Center(

        child: Transform.scale(
          scale: 5, // Facteur d'échelle pour agrandir l'animation
          child: Lottie.asset(
            'assets/pash.json',
            fit: BoxFit.cover,
          ),


        ),
      ),
      nextScreen: ImagePage(),
      duration: 5000,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
