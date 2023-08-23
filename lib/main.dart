
import 'package:battlevids/ddss.dart';
import 'package:battlevids/search.dart';
import 'package:battlevids/splashscreen.dart';
import 'package:battlevids/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeNotifier>(context).currentTheme,
      builder: (context, child) =>
          ResponsiveWrapper.builder(
            child,
            maxWidth: 1200,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(450, name: MOBILE),
              ResponsiveBreakpoint.autoScale(450, name: MOBILE),
              ResponsiveBreakpoint.autoScale(450, name: TABLET),
              ResponsiveBreakpoint.resize(450, name: TABLET),
              ResponsiveBreakpoint.resize(450, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(450, name: DESKTOP),
            ],
          ),
      home: Splash(),
    );
  }
}
