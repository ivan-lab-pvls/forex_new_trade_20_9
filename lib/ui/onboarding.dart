import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _controller = PageController();

  final List<Widget> _pages = [
    Column(
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/1.png",
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Stay updated",
                  style: GoogleFonts.dmSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Read news on the news page and stay updated",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
    Column(
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/2.png",
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Analyze",
                  style: GoogleFonts.dmSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Analyze trading charts of the forex pairs that are available in the app",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
    Column(
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/3.png",
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Settings",
                  style: GoogleFonts.dmSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Rate the app, read about the app, or set up some settings. All of it you can do on the settings page",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 72, 18),
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              controller: _controller,
              children: _pages,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                onDotClicked: (index) {
                  _controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                controller: _controller,
                count: 3,
                effect: const WormEffect(
                  activeDotColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _currentPage == 2
          ? FloatingActionButton.extended(
              backgroundColor: const Color.fromARGB(255, 29, 160, 136),
              onPressed: () {
                RxSharedPreferences.getInstance().setBool("authendicate", true);
                Navigator.of(context).pushReplacementNamed("/main");
              },
              label: Row(
                children: [
                  Text(
                    "Start",
                    style: GoogleFonts.dmSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            )
          : null,
    );
  }
}
