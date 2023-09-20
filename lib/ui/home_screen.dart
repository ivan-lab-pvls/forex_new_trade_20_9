import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trading_app/ui/assets_page.dart';
import 'package:trading_app/ui/commuty_page.dart';
import 'package:trading_app/ui/news_ppage.dart';
import 'package:trading_app/ui/settings.dart';

import 'game_data.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _selectedTab = 0;

  static List<Widget> tabs = [
    const NewListPage(),
    const CommunityListPage(),
    const AnalysisListPage(),
    GamePage(),
    const SettingsListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 72, 18),
      body: SafeArea(
        child: tabs[_selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (value) {
          setState(() {
            _selectedTab = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 27, 72, 18),
        elevation: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: GoogleFonts.dmSans(
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: GoogleFonts.dmSans(
          fontWeight: FontWeight.w500,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
            ),
            label: "News",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.collections,
            ),
            label: "Community",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.money_pound_circle,
            ),
            label: "Assets",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.game_controller,
            ),
            label: "Test Quiz",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.settings_solid,
            ),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
