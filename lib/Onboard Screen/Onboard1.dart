import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallpaper/Auth/LogIn.dart';
import '../UI/SuperHero.dart';

class OnboardScreenOne extends StatefulWidget {
  const OnboardScreenOne({Key? key}) : super(key: key);

  @override
  State<OnboardScreenOne> createState() => _OnboardScreenOneState();
}

class _OnboardScreenOneState extends State<OnboardScreenOne> {
  final PageController _controller = PageController();
  bool finalPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          onPageChanged: (index) {
            setState(() {
              finalPage = (index == 2);
            });
          },
          controller: _controller,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                "assets/images/pana.png",
              ),
              Text(
                "Look for categorized wallpaper!",
                style: GoogleFonts.aBeeZee(fontSize: 25),
              )
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                "assets/images/on1.png",
              ),
              Text(
                "Once you love it!",
                style: GoogleFonts.aBeeZee(fontSize: 25),
              )
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                "assets/images/on2.png",
              ),
              Text(
                "Just keep it in your bag!",
                style: GoogleFonts.aBeeZee(fontSize: 25),
              )
            ]),
          ],
        ),
        Container(
          alignment: const Alignment(0, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //first skip button here
              GestureDetector(
                onTap: () {
                  _controller.jumpToPage(2);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text("Skip",
                      style: GoogleFonts.arefRuqaa(
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          color: Colors.black)),
                ),
              ),

              //then add smooth page indicator here

              SmoothPageIndicator(controller: _controller, count: 3),

              //if last page then this else
              finalPage
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogIn()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          'Done',
                          style: GoogleFonts.arefRuqaa(
                              fontSize: 20,
                              decoration: TextDecoration.none,
                              color: Colors.black),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeIn);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          'Next',
                          style: GoogleFonts.arefRuqaa(
                              fontSize: 20,
                              decoration: TextDecoration.none,
                              color: Colors.black),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ]),
    );
  }
}
