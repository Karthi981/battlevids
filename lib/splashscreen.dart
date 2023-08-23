import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'ott.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        centered: true,
        duration: 800,
        splashIconSize: double.maxFinite,
        splash: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color(0xff1f005c),
                Color(0xff5b0060),
                Color(0xff870160),
                Color(0xffac255e),
                Color(0xffca485c),
                Color(0xffe16b5c),
                Color(0xfff39060),
                Color(0xffffb56b),
              ], // Gradient from https://learnui.design/tools/gradient-generator.html
              tileMode: TileMode.mirror,
            ),
          ),
          child: Center(
            child: Center(
              child: RichText(
                text: const TextSpan(
                    text: "B",style: TextStyle(
                    color: Colors.red,
                    fontSize: 38,
                    fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(text: "attleVids",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ))
                    ]
                ),
              ),
            ) ,),
        ),
        nextScreen: const Ott1(),
        splashTransition: SplashTransition.fadeTransition,
        );
  }
}
