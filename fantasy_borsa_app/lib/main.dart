import 'package:fantasy_borsa_app/screens/animation.dart';
import 'package:fantasy_borsa_app/screens/home/home_screen.dart';
import 'package:fantasy_borsa_app/screens/signin/signin_screen.dart';
import 'package:fantasy_borsa_app/screens/signup/signup_screen.dart';
import 'package:fantasy_borsa_app/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('tr'),
      ],
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
      theme: ThemeData(
        fontFamily: GoogleFonts.kumbhSans().fontFamily,
      ),
      initialRoute: '/animation',
      getPages: [
        GetPage(name: '/animation', page: () => WaterGlassAnimation()),
        GetPage(
          name: '/welcome',
          page: () => const WelcomeScreen(),
        ),
        GetPage(name: '/signIn', page: () => SignInScreen()),
        GetPage(
          name: '/signUp',
          page: () => const SignUpScreen(),
        ),
        GetPage(
          name: "/home",
          page: () => const HomeScreen(),
        ),
      ],
    );
  }
}
