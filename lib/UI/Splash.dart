import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:wallpaper/Onboard%20Screen/Onboard1.dart';

class MainPageOne extends StatefulWidget {
  const MainPageOne({Key? key}) : super(key: key);

  @override
  State<MainPageOne> createState() => _MainPageOneState();
}

class _MainPageOneState extends State<MainPageOne> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const OnboardScreenOne()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/blue.jpg",
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
              alignment: const Alignment(0.5, 0.2),
              child: Lottie.asset("assets/images/camera.json", reverse: true)),
          Positioned(
              top: 630,
              left: 100,
              child: Text(
                "Minimal Vibe",
                textScaleFactor: 1.5,
                style: GoogleFonts.lobster(
                    fontSize: 30, color: Colors.cyan.shade800),
              ))
        ],
      ),
    );
  }
}
