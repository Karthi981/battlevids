
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//header colo
Color as =Colors.red;

Color abc = const Color(0xFF111528);

Color red = const Color(0xFF0E0D0D);

Color whi = const Color(0xFFFFFFFF);

Color grey = const Color(0xFFDAD0D0);

Color light = Color(0xC3E3DCDC);

Gradient grd =LinearGradient(
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
);

TextStyle sd = TextStyle(color: abc,fontSize: 28,fontWeight: FontWeight.bold);

TextStyle nor = TextStyle(color: abc,fontWeight: FontWeight.normal,);

TextStyle bold =TextStyle(color: whi,fontWeight: FontWeight.bold);

TextStyle ggnor = GoogleFonts.lato(color: whi);

TextStyle ggnor15 = GoogleFonts.lato(color: whi,fontSize: 15);

TextStyle gggrey = GoogleFonts.lato(color: grey);


TextStyle ggbold = GoogleFonts.lato(color: whi,fontWeight: FontWeight.bold,fontSize: 18);

TextStyle supergg = GoogleFonts.lato(color: whi,fontWeight: FontWeight.bold,fontSize: 28);
////body

Color org = Colors.orangeAccent;
