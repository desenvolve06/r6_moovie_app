import 'dart:async';
import 'package:flutter/material.dart';
import 'package:r6_moovie_app/resources/app_colors.dart';
import 'package:r6_moovie_app/resources/app_values.dart';
import 'package:r6_moovie_app/resources/asset_path.dart';

import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: Center(
        // child: Image.asset(
        //   AssetPath.logoKoruFlix,
        // ),
        child: Image.asset(
          AssetPath.logoKoruFlix,
          width: 280,
        ),
      ),
    );
  }
}

