import 'package:flutter/material.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:forex_trading/ui/home_screen.dart';
import 'package:forex_trading/ui/onboarding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final RxSharedPreferences prefs = RxSharedPreferences.getInstance();
  final bool? turnOfNotifications = await prefs.getBool("turnOfNotifications");
  if (turnOfNotifications == null) {
    await RxSharedPreferences.getInstance().setBool("turnOfNotifications", true);
  }
  final bool? authendicate = await prefs.getBool("authendicate");
  runApp(
    MainApp(
      authendicate: authendicate ?? false,
    ),
  );
}

class MainApp extends StatelessWidget {
  final bool authendicate;
  const MainApp({
    super.key,
    required this.authendicate,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: authendicate ? "/main" : "/",
      routes: {
        "/": (context) => const SplashScreen(),
        "/main": (context) => const MainHomePage(),
      },
    );
  }
}
