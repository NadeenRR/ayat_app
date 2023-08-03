import 'package:ayat_app/screens/azkar.dart';
import 'package:ayat_app/screens/home_screen.dart';
import 'package:ayat_app/screens/masaa.dart';
import 'package:ayat_app/screens/qiblah_compass.dart';
import 'package:ayat_app/screens/splash_screen.dart';
import 'package:ayat_app/screens/suhar_alquran.dart';
import 'package:ayat_app/screens/asab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ayat App',
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/suhar': (context) => const SuharAlQuranImage(),
        '/azkar': (context) => const Azkar(),
        '/alsabah': (context) => const Alsabah(),
        '/almasaa': (context) => const Almasaa(),
        '/qiblah': (context) => const QiblahCompassPage(),
      },
    );
  }
}

