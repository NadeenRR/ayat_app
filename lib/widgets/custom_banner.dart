import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/constant.dart';

class CustomBanner extends StatefulWidget {
  const CustomBanner({super.key});

  @override
  State<CustomBanner> createState() => _CustomBannerState();
}

class _CustomBannerState extends State<CustomBanner> {
  int currentIndex = 0;

  void _showNextText() {
    setState(() {
      currentIndex = (currentIndex + 1) % texts.length;
    });
  }

  @override
  void initState() {
    super.initState();
    _showTexts();
  }

  void _showTexts() {
    for (int i = 0; i < texts.length; i++) {
      Timer(Duration(seconds: i * 10), _showNextText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/mosquH.jpg'),
            ),
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                begin: Alignment(0, -1),
                end: Alignment(0, 1),
                colors: kColorList,
                stops: <double>[0, 0.474, 1, 1],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 90,
                bottom: 90,
              ),
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    texts[currentIndex],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      wordSpacing: 2,
                      fontSize: 22,
                      color: Colors.white,
                      fontFamily: 'Quran',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
